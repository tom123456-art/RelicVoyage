<script setup>
import { reactive } from 'vue'
import { useRouter } from 'vue-router'
import { setAdminSession } from '@/utils/session'

const router = useRouter()

const form = reactive({
  username: '',
  password: '',
})

function handleSubmit() {
  setAdminSession(form.username.trim() || 'admin')
  router.push('/admin')
}
</script>

<template>
  <section class="auth-page">
    <div class="auth-backdrop"></div>
    <div class="auth-stage">
      <aside class="auth-card">
        <div class="auth-card__head">
          <p class="auth-card__eyebrow">管理员登录</p>
          <h2>进入后台</h2>
        </div>

        <form class="form" @submit.prevent="handleSubmit">
          <div class="field">
            <label class="label" for="admin-username">管理员账号</label>
            <input
              id="admin-username"
              v-model="form.username"
              class="input"
              name="username"
              placeholder="请输入管理员账号"
              required
            />
          </div>
          <div class="field">
            <label class="label" for="admin-password">密码</label>
            <input
              id="admin-password"
              v-model="form.password"
              class="input"
              name="password"
              type="password"
              placeholder="请输入管理员密码"
              required
            />
          </div>
          <button class="button button--primary auth-card__submit" type="submit">登录</button>
        </form>
      </aside>
    </div>
  </section>
</template>
