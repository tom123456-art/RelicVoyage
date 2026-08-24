<script setup>
import { computed, onBeforeUnmount, onMounted, reactive, ref } from 'vue'
import { useRoute } from 'vue-router'
import { getSession } from '@/utils/session'

const BALL_SIZE = 68
const BALL_MARGIN = 18
const DRAG_THRESHOLD = 6

const route = useRoute()
const isOpen = ref(false)
const isDragging = ref(false)
const initialized = ref(false)
const hasMoved = ref(false)
const draftMessage = ref('')
const pointerOffset = reactive({
  x: 0,
  y: 0,
})
const position = reactive({
  x: 0,
  y: 0,
})

const messages = ref([
  {
    role: 'assistant',
    text: '你好，我是 AI 智能问答助手。当前是前端占位版，后续可以直接接入大模型接口。',
  },
  {
    role: 'assistant',
    text: '现在已经支持全局悬浮入口，管理员端和用户端的每个页面都可以直接打开我。',
  },
])

const quickActions = [
  '介绍一下当前页面',
  '这个功能怎么使用？',
  '后续如何接入大模型？',
]

const currentSession = computed(() => {
  route.fullPath
  return getSession()
})
const currentRoleLabel = computed(() => {
  if (!currentSession.value) {
    return '访客端'
  }

  return currentSession.value.role === 'admin' ? '管理员端' : '用户端'
})
const currentRouteLabel = computed(() => route.path)

function clamp(value, min, max) {
  return Math.min(Math.max(value, min), max)
}

function getViewportBounds() {
  return {
    minX: BALL_MARGIN,
    minY: BALL_MARGIN,
    maxX: Math.max(BALL_MARGIN, window.innerWidth - BALL_SIZE - BALL_MARGIN),
    maxY: Math.max(BALL_MARGIN, window.innerHeight - BALL_SIZE - BALL_MARGIN),
  }
}

function setPosition(nextX, nextY) {
  const bounds = getViewportBounds()
  position.x = clamp(nextX, bounds.minX, bounds.maxX)
  position.y = clamp(nextY, bounds.minY, bounds.maxY)
}

function initializePosition() {
  if (initialized.value) {
    return
  }

  const bounds = getViewportBounds()
  position.x = bounds.maxX
  position.y = Math.max(bounds.minY, bounds.maxY - 96)
  initialized.value = true
}

function toggleDialog() {
  isOpen.value = !isOpen.value
}

function closeDialog() {
  isOpen.value = false
}

function handleQuickAction(text) {
  draftMessage.value = text
}

function sendMessage() {
  const content = draftMessage.value.trim()
  if (!content) {
    return
  }

  messages.value.push({
    role: 'user',
    text: content,
  })
  messages.value.push({
    role: 'assistant',
    text: `已收到你的问题：“${content}”。当前版本先保留前端交互，后续接入大模型后会结合 ${currentRoleLabel.value} 与页面 ${currentRouteLabel.value} 提供真实回答。`,
  })
  draftMessage.value = ''
}

function handlePointerMove(event) {
  if (!isDragging.value) {
    return
  }

  const nextX = event.clientX - pointerOffset.x
  const nextY = event.clientY - pointerOffset.y

  if (
    Math.abs(nextX - position.x) > DRAG_THRESHOLD ||
    Math.abs(nextY - position.y) > DRAG_THRESHOLD
  ) {
    hasMoved.value = true
  }

  setPosition(nextX, nextY)
}

function handlePointerUp() {
  if (!isDragging.value) {
    return
  }

  const moved = hasMoved.value
  isDragging.value = false
  hasMoved.value = false
  window.removeEventListener('pointermove', handlePointerMove)
  window.removeEventListener('pointerup', handlePointerUp)

  if (!moved) {
    toggleDialog()
  }
}

function handlePointerDown(event) {
  if (event.pointerType === 'mouse' && event.button !== 0) {
    return
  }

  event.preventDefault()
  isDragging.value = true
  hasMoved.value = false
  pointerOffset.x = event.clientX - position.x
  pointerOffset.y = event.clientY - position.y

  window.addEventListener('pointermove', handlePointerMove)
  window.addEventListener('pointerup', handlePointerUp)
}

function handleResize() {
  if (!initialized.value) {
    initializePosition()
    return
  }

  setPosition(position.x, position.y)
}

onMounted(() => {
  initializePosition()
  window.addEventListener('resize', handleResize)
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', handleResize)
  window.removeEventListener('pointermove', handlePointerMove)
  window.removeEventListener('pointerup', handlePointerUp)
})
</script>

<template>
  <Teleport to="body">
    <div
      v-if="initialized"
      class="ai-float-ball"
      :class="{ 'is-dragging': isDragging, 'is-open': isOpen }"
      :style="{ left: `${position.x}px`, top: `${position.y}px` }"
      role="button"
      tabindex="0"
      aria-label="打开 AI 智能问答"
      @pointerdown="handlePointerDown"
      @keydown.enter.prevent="toggleDialog"
      @keydown.space.prevent="toggleDialog"
    >
      <span class="ai-float-ball__core">AI</span>
      <span class="ai-float-ball__halo"></span>
    </div>

    <div v-if="isOpen" class="ai-panel-backdrop" @click="closeDialog"></div>

    <section
      v-if="isOpen"
      class="ai-panel"
      role="dialog"
      aria-modal="true"
      aria-label="AI 智能问答"
    >
      <header class="ai-panel__header">
        <div>
          <p class="ai-panel__eyebrow">AI Assistant</p>
          <h3>智能问答</h3>
          <p class="ai-panel__meta">{{ currentRoleLabel }} · {{ currentRouteLabel }}</p>
        </div>
        <button type="button" class="ai-panel__close" @click="closeDialog">×</button>
      </header>

      <div class="ai-panel__quick-actions">
        <button
          v-for="action in quickActions"
          :key="action"
          type="button"
          class="ai-panel__chip"
          @click="handleQuickAction(action)"
        >
          {{ action }}
        </button>
      </div>

      <div class="ai-panel__messages">
        <article
          v-for="(message, index) in messages"
          :key="`${message.role}-${index}`"
          class="ai-message"
          :class="message.role === 'user' ? 'ai-message--user' : 'ai-message--assistant'"
        >
          <span class="ai-message__role">{{ message.role === 'user' ? '我' : 'AI' }}</span>
          <p>{{ message.text }}</p>
        </article>
      </div>

      <footer class="ai-panel__composer">
        <label class="ai-panel__label" for="ai-message-box">输入问题</label>
        <textarea
          id="ai-message-box"
          v-model="draftMessage"
          class="ai-panel__textarea"
          placeholder="例如：介绍当前页面功能，或者说明后续如何接入 AI 大模型。"
          @keydown.enter.exact.prevent="sendMessage"
        ></textarea>
        <div class="ai-panel__actions">
          <span class="ai-panel__hint">当前是前端占位版，后续可直接替换为真实 AI 对话接口。</span>
          <button type="button" class="button button--primary" @click="sendMessage">发送</button>
        </div>
      </footer>
    </section>
  </Teleport>
</template>
