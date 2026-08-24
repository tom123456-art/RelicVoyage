<script setup>
import { computed, reactive, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { setAdminSession, setUserSession } from '@/utils/session'

const route = useRoute()
const router = useRouter()
const errorMessage = ref('')

const loginRole = ref(route.query.role === 'admin' ? 'admin' : 'user')

const form = reactive({
  username: '',
  password: '',
})

const loginTitle = computed(() =>
  loginRole.value === 'admin' ? '进入后台' : '进入系统',
)

const usernameLabel = computed(() =>
  loginRole.value === 'admin' ? '管理员账号' : '用户名',
)

const usernamePlaceholder = computed(() =>
  loginRole.value === 'admin' ? '请输入管理员账号' : '请输入用户名',
)

const submitLabel = computed(() =>
  loginRole.value === 'admin' ? '管理员登录' : '登录',
)

watch(
  () => route.query.role,
  (role) => {
    loginRole.value = role === 'admin' ? 'admin' : 'user'
    errorMessage.value = ''
  },
)

function switchRole(role) {
  loginRole.value = role
  errorMessage.value = ''
  router.replace({
    path: '/login',
    query: role === 'admin' ? { role: 'admin' } : {},
  })
}

function handleSubmit() {
  const username = form.username.trim()
  const password = form.password.trim()

  errorMessage.value = ''

  if (!username) {
    errorMessage.value =
      loginRole.value === 'admin' ? '请输入管理员账号。' : '请输入用户名。'
    return
  }

  if (!password) {
    errorMessage.value = '请输入密码。'
    return
  }

  if (loginRole.value === 'admin') {
    setAdminSession(username)
    router.push('/admin')
    return
  }

  setUserSession(username)
  router.push('/')
}
</script>

<template>
  <section class="auth-page">
    <div class="auth-backdrop"></div>
    <div class="auth-stage">
      <aside class="auth-card">
        <div class="auth-switch" :class="loginRole === 'admin' ? 'is-admin' : 'is-user'">
          <button
            type="button"
            class="auth-switch__tab"
            :class="{ 'is-active': loginRole === 'user' }"
            @click="switchRole('user')"
          >
            用户
          </button>
          <button
            type="button"
            class="auth-switch__tab"
            :class="{ 'is-active': loginRole === 'admin' }"
            @click="switchRole('admin')"
          >
            管理员
          </button>
        </div>

        <div class="auth-card__head">
          <p class="auth-card__eyebrow">{{ loginRole === 'admin' ? '管理员登录' : '用户登录' }}</p>
          <h2>{{ loginTitle }}</h2>
        </div>

        <form class="form" @submit.prevent="handleSubmit">
          <div class="field">
            <label class="label" for="login-username">{{ usernameLabel }}</label>
            <input
              id="login-username"
              v-model="form.username"
              class="input"
              name="username"
              :placeholder="usernamePlaceholder"
              @input="errorMessage = ''"
              required
            />
          </div>
          <div class="field">
            <label class="label" for="login-password">密码</label>
            <input
              id="login-password"
              v-model="form.password"
              class="input"
              name="password"
              type="password"
              placeholder="请输入密码"
              @input="errorMessage = ''"
              required
            />
          </div>
          <p v-if="errorMessage" class="field-error">{{ errorMessage }}</p>
          <button class="button button--primary auth-card__submit" type="submit">
            {{ submitLabel }}
          </button>
        </form>
      </aside>
    </div>
  </section>
</template>
