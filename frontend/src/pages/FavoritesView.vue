<script setup>
import { favoriteArtifacts } from '@/data/mock'
import { endpoints } from '@/data/endpoints'

const noop = () => {}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>我的收藏</strong>
        <p>已收藏的文物条目。</p>
      </div>
    </div>

    <div v-if="favoriteArtifacts.length" class="card-grid">
      <article v-for="item in favoriteArtifacts" :key="item.id" class="card">
        <img :src="item.imageUrl || item.image" :alt="item.name" class="card-media" />
        <div class="card-body">
          <div class="tag-row">
            <span class="tag">{{ item.dynasty }}</span>
            <span class="tag tag--teal">{{ item.material }}</span>
          </div>
          <h3>{{ item.name }}</h3>
          <p>{{ item.description }}</p>
          <div class="button-row">
            <RouterLink :to="`/artifacts/${item.id}`" class="button button--secondary">查看详情</RouterLink>
            <form :action="endpoints.artifacts.favoriteRemove" method="post" @submit.prevent="noop">
              <input type="hidden" name="artifactId" :value="item.id" />
              <button type="submit" class="button button--ghost">取消收藏</button>
            </form>
          </div>
        </div>
      </article>
    </div>

    <div v-else class="empty">当前没有收藏内容。</div>
  </section>
</template>
