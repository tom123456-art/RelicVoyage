<script setup>
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { setUserSession } from '@/utils/session'

const router = useRouter()

const form = reactive({
  username: '',
  password: '',
  confirmPassword: '',
  phone: '',
  email: '',
})

const errors = reactive({
  username: '',
  password: '',
  confirmPassword: '',
  phone: '',
  email: '',
})

function clearErrors() {
  errors.username = ''
  errors.password = ''
  errors.confirmPassword = ''
  errors.phone = ''
  errors.email = ''
}

function handleSubmit() {
  const username = form.username.trim()
  const password = form.password
  const confirmPassword = form.confirmPassword
  const phone = form.phone.trim()
  const email = form.email.trim()

  clearErrors()

  if (!username) {
    errors.username = '请输入用户名。'
  }

  if (!password) {
    errors.password = '请输入密码。'
  }

  if (password !== confirmPassword) {
    errors.confirmPassword = '两次输入的密码不一致。'
  }

  if (phone && !/^\d{11}$/.test(phone)) {
    errors.phone = '手机号必须是 11 位数字。'
  }

  if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    errors.email = '邮箱格式不正确。'
  }

  if (Object.values(errors).some(Boolean)) {
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
        <div class="auth-card__head">
          <p class="auth-card__eyebrow">用户注册</p>
          <h2>创建账号</h2>
        </div>

        <form class="form" @submit.prevent="handleSubmit">
          <div class="field">
            <label class="label" for="register-username">用户名</label>
            <input
              id="register-username"
              v-model="form.username"
              class="input"
              name="username"
              placeholder="设置用户名"
              @input="errors.username = ''"
              required
            />
            <p v-if="errors.username" class="field-error">{{ errors.username }}</p>
          </div>
          <div class="field">
            <label class="label" for="register-password">密码</label>
            <input
              id="register-password"
              v-model="form.password"
              class="input"
              name="password"
              type="password"
              placeholder="设置密码"
              @input="errors.password = ''; errors.confirmPassword = ''"
              required
            />
            <p v-if="errors.password" class="field-error">{{ errors.password }}</p>
          </div>
          <div class="field">
            <label class="label" for="register-confirm-password">确认密码</label>
            <input
              id="register-confirm-password"
              v-model="form.confirmPassword"
              class="input"
              name="confirmPassword"
              type="password"
              placeholder="再次输入密码"
              @input="errors.confirmPassword = ''"
              required
            />
            <p v-if="errors.confirmPassword" class="field-error">{{ errors.confirmPassword }}</p>
          </div>
          <div class="field">
            <label class="label" for="register-phone">手机号</label>
            <input
              id="register-phone"
              v-model="form.phone"
              class="input"
              name="phone"
              placeholder="手机号"
              @input="errors.phone = ''"
            />
            <p v-if="errors.phone" class="field-error">{{ errors.phone }}</p>
          </div>
          <div class="field">
            <label class="label" for="register-email">邮箱</label>
            <input
              id="register-email"
              v-model="form.email"
              class="input"
              name="email"
              type="email"
              placeholder="邮箱"
              @input="errors.email = ''"
            />
            <p v-if="errors.email" class="field-error">{{ errors.email }}</p>
          </div>
          <button class="button button--primary auth-card__submit" type="submit">注册</button>
        </form>
      </aside>
    </div>
  </section>
</template>
