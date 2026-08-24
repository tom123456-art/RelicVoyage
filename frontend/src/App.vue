<script setup>
import { computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import AiAssistantFloat from '@/components/AiAssistantFloat.vue'
import ModuleLauncher from '@/components/ModuleLauncher.vue'
import { clearSession, getSession } from '@/utils/session'

const route = useRoute()
const router = useRouter()

const authPaths = ['/login', '/register', '/admin/login']

const isAuthRoute = computed(() => authPaths.includes(route.path))
const shellClass = computed(() =>
  isAuthRoute.value ? 'app-shell--auth' : 'app-shell--workspace',
)
const currentSession = computed(() => {
  route.fullPath
  return getSession()
})
const isAdminAccount = computed(() => currentSession.value?.role === 'admin')
const accountName = computed(() => currentSession.value?.username ?? '当前账号')
const logoutTarget = computed(() => (isAdminAccount.value ? '/login?role=admin' : '/login'))
const brandTarget = computed(() => (isAdminAccount.value ? '/admin' : '/'))

const authNavItems = computed(() => [
  { to: '/login', label: '登录' },
  { to: '/register', label: '注册' },
])

const userSections = [
  {
    title: '浏览入口',
    items: [
      { to: '/', label: '首页', desc: '图表总览与最近动态' },
      { to: '/artifacts', label: '文物', desc: '筛选、浏览与详情查看' },
      { to: '/museums', label: '博物馆', desc: '场馆信息与馆藏导览' },
      { to: '/profile', label: '个人中心', desc: '资料与收藏管理' },
    ],
  },
]

const adminSections = [
  {
    title: '管理中心',
    items: [
      { to: '/admin', label: '管理总览', desc: '运营图表与最近操作' },
      { to: '/admin/artifacts', label: '文物管理', desc: '文物信息维护与列表管理' },
      { to: '/admin/museums', label: '博物馆管理', desc: '场馆信息维护与列表管理' },
      { to: '/admin/users', label: '用户管理', desc: '账号权限与状态维护' },
    ],
  },
]

adminSections[0].items[0].match = (path) => path === '/admin' || path === '/admin/home'
if (!adminSections[0].items.some((item) => item.to === '/admin/comments')) {
  adminSections[0].items.push({
    to: '/admin/comments',
    label: '评论回复',
    desc: '回复文物评论与查看交流内容',
  })
}

const moduleSections = computed(() => (isAdminAccount.value ? adminSections : userSections))

watch(
  isAuthRoute,
  (value) => {
    if (typeof document === 'undefined') {
      return
    }

    document.body.classList.toggle('workspace-theme', !value)
  },
  { immediate: true },
)
const moduleTitle = computed(() => (isAdminAccount.value ? '管理模块栏' : '功能模块栏'))

function handleLogout() {
  clearSession()
  router.push(logoutTarget.value)
}

function isAuthNavActive(item) {
  return route.path === item.to
}
</script>

<template>
  <div class="app-shell" :class="shellClass">
    <header class="topbar">
      <div class="topbar-main">
        <RouterLink :to="brandTarget" class="brand">
          <span class="brand-copy">
            <strong>博物寻踪</strong>
            <small>文物数字展示与智能导览平台</small>
          </span>
        </RouterLink>

        <div v-if="isAuthRoute" class="topbar-actions topbar-actions--auth">
          <RouterLink
            v-for="item in authNavItems"
            :key="item.to"
            :to="item.to"
            class="auth-nav-link"
            :class="{ 'is-active': isAuthNavActive(item) }"
          >
            {{ item.label }}
          </RouterLink>
        </div>

        <div v-else-if="currentSession" class="topbar-actions">
          <span class="role-chip">{{ accountName }}</span>
          <button type="button" class="button button--ghost topbar-button" @click="handleLogout">
            退出登录
          </button>
        </div>
      </div>

      <ModuleLauncher
        v-if="!isAuthRoute && currentSession"
        :title="moduleTitle"
        :role="accountName"
        :sections="moduleSections"
      />
    </header>

    <main class="page" :class="{ 'page--auth': isAuthRoute }">
      <RouterView />
    </main>

    <AiAssistantFloat v-if="!isAuthRoute && currentSession" />
  </div>
</template>
