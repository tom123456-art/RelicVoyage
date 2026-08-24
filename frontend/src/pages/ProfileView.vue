<script setup>
import { computed, reactive } from 'vue'
import { currentUser } from '@/data/mock'
import { getSession } from '@/utils/session'

const session = computed(() => getSession())

const form = reactive({
  name: session.value?.username ?? currentUser.name,
  phone: currentUser.phone,
  email: currentUser.email,
  city: currentUser.city,
  bio: currentUser.bio,
})

const displayName = computed(() => session.value?.username ?? currentUser.name)

const noop = () => {}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>个人中心</strong>
        <p>查看账号资料、收藏入口和个人信息。</p>
      </div>
      <RouterLink class="button button--ghost" to="/profile/favorites">我的收藏</RouterLink>
    </div>

    <div class="detail-layout">
      <aside class="detail-panel">
        <div class="tag-row" style="margin-bottom: 1rem">
          <span class="tag">当前账号</span>
          <span class="tag tag--teal">{{ currentUser.favoriteCount }} 件收藏</span>
        </div>
        <div class="info-list">
          <div class="info-row">
            <span>当前用户名</span>
            <strong>{{ displayName }}</strong>
          </div>
          <div class="info-row">
            <span>收藏数量</span>
            <strong>{{ currentUser.favoriteCount }}</strong>
          </div>
          <div class="info-row">
            <span>常驻城市</span>
            <strong>{{ currentUser.city }}</strong>
          </div>
        </div>
      </aside>

      <aside class="detail-panel">
        <form class="form" @submit.prevent="noop">
          <div class="form-grid">
            <div class="field">
              <label class="label" for="profile-name">用户名</label>
              <input id="profile-name" v-model="form.name" class="input" name="name" />
            </div>
            <div class="field">
              <label class="label" for="profile-city">城市</label>
              <input id="profile-city" v-model="form.city" class="input" name="city" />
            </div>
            <div class="field">
              <label class="label" for="profile-phone">手机号</label>
              <input id="profile-phone" v-model="form.phone" class="input" name="phone" />
            </div>
            <div class="field">
              <label class="label" for="profile-email">邮箱</label>
              <input id="profile-email" v-model="form.email" class="input" name="email" type="email" />
            </div>
            <div class="field field--full">
              <label class="label" for="profile-bio">个人简介</label>
              <textarea id="profile-bio" v-model="form.bio" class="textarea" name="bio"></textarea>
            </div>
          </div>
          <button class="button button--primary" type="submit">保存资料</button>
        </form>
      </aside>
    </div>
  </section>
</template>
