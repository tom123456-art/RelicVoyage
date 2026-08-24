<script setup>
import { computed, ref, watch } from 'vue'
import { useRoute } from 'vue-router'

const props = defineProps({
  title: {
    type: String,
    default: '功能模块栏',
  },
  sections: {
    type: Array,
    required: true,
  },
  role: {
    type: String,
    default: '用户端',
  },
})

const route = useRoute()
const open = ref(false)

const navItems = computed(() =>
  props.sections.flatMap((section) => section.items),
)

function isActiveItem(item) {
  if (typeof item.match === 'function') {
    return item.match(route.path)
  }
  if (item.exact) {
    return route.path === item.to
  }
  return route.path === item.to || route.path.startsWith(`${item.to}/`)
}

function openPanel() {
  open.value = true
}

function closePanel() {
  open.value = false
}

watch(
  () => route.path,
  () => {
    closePanel()
  },
)
</script>

<template>
  <div
    class="module-launcher"
    :class="{ 'is-open': open }"
    @mouseenter="openPanel"
    @mouseleave="closePanel"
  >
    <div
      class="module-hotspot"
      :aria-label="`${role}${title}`"
      role="button"
      tabindex="0"
      @focusin="openPanel"
      @keydown.esc="closePanel"
    >
      <span class="module-hotspot__line"></span>
    </div>

    <div class="module-nav-wrap">
      <nav class="module-nav-shell" :aria-label="`${role}${title}`">
        <RouterLink
          v-for="item in navItems"
          :key="item.to"
          :to="item.to"
          class="module-nav__link"
          :class="{ 'is-active': isActiveItem(item) }"
          @click="closePanel"
        >
          {{ item.label }}
        </RouterLink>
      </nav>
    </div>
  </div>
</template>
