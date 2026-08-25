<script setup>
import { computed, ref, watch } from 'vue'
import { useRoute } from 'vue-router'
import { endpoints } from '@/data/endpoints'
import { fetchArtifactById, fetchArtifacts, resolveArtifactImage } from '@/api/artifacts'

const route = useRoute()
const noop = () => {}

const loading = ref(false)
const error = ref('')
const artifact = ref(null)
const relatedArtifacts = ref([])

const museum = computed(() =>
  artifact.value
    ? {
        id: artifact.value.museumId,
        name: artifact.value.museumName,
      }
    : null,
)

async function loadArtifact(id) {
  if (!id) {
    return
  }

  loading.value = true
  error.value = ''
  artifact.value = null
  relatedArtifacts.value = []

  try {
    const currentArtifact = await fetchArtifactById(id)
    artifact.value = currentArtifact

    const allArtifacts = await fetchArtifacts()
    relatedArtifacts.value = allArtifacts
      .filter((item) => item.museumId === currentArtifact.museumId && item.id !== currentArtifact.id)
      .slice(0, 3)
  } catch (err) {
    error.value = '文物详情加载失败，请检查后端服务和数据库连接。'
    console.error(err)
  } finally {
    loading.value = false
  }
}

watch(
  () => route.params.id,
  (id) => {
    loadArtifact(id)
  },
  { immediate: true },
)
</script>

<template>
  <section v-if="loading" class="section">
    <div class="empty">文物详情加载中...</div>
  </section>

  <section v-else-if="error" class="section">
    <div class="empty">{{ error }}</div>
  </section>

  <template v-else-if="artifact">
    <section class="detail-layout">
      <article class="detail-panel">
        <figure class="detail-figure media-frame">
          <img :src="resolveArtifactImage(artifact.imageUrl)" :alt="artifact.name" />
        </figure>

        <div class="tag-row" style="margin-top: 1rem">
          <span class="tag">{{ artifact.dynasty }}</span>
          <span class="tag tag--teal">{{ artifact.material }}</span>
          <span class="tag">{{ artifact.type }}</span>
        </div>
      </article>

      <aside class="detail-panel">
        <p class="eyebrow">文物详情</p>
        <h1 style="margin: 0 0 0.5rem; font-family: 'Source Han Serif SC', 'Noto Serif SC', 'Songti SC', serif">
          {{ artifact.name }}
        </h1>
        <p class="lead">{{ artifact.description }}</p>

        <div class="info-list">
          <div class="info-row">
            <span>所属博物馆</span>
            <strong>{{ museum?.name }}</strong>
          </div>
          <div class="info-row">
            <span>出土地</span>
            <strong>{{ artifact.origin }}</strong>
          </div>
          <div class="info-row">
            <span>收藏数</span>
            <strong>{{ artifact.favoriteCount }}</strong>
          </div>
        </div>

        <form
          class="form"
          :action="endpoints.artifacts.favoriteAdd"
          method="post"
          @submit.prevent="noop"
          style="margin-top: 1rem"
        >
          <input type="hidden" name="artifactId" :value="artifact.id" />
          <div class="artifact-action-row">
            <div class="artifact-favorite-summary" aria-label="当前收藏人数">
              <span>当前收藏人数</span>
              <strong>{{ artifact.favoriteCount }}</strong>
              <small>人已收藏</small>
            </div>
            <button type="submit" class="button button--primary">
              收藏
              <span class="button-count">{{ artifact.favoriteCount }}</span>
            </button>
            <RouterLink to="/artifacts" class="button button--ghost">返回列表</RouterLink>
          </div>
        </form>
      </aside>
    </section>

    <section class="section">
      <div class="section-header">
        <div>
          <h2>同馆文物</h2>
          <p>与当前文物同属一个博物馆的精选条目。</p>
        </div>
      </div>

      <div v-if="!relatedArtifacts.length" class="empty">当前没有可展示的同馆文物。</div>

      <div v-else class="card-grid">
        <article v-for="item in relatedArtifacts" :key="item.id" class="card">
          <img :src="resolveArtifactImage(item.imageUrl)" :alt="item.name" class="card-media" />
          <div class="card-body">
            <div class="tag-row">
              <span class="tag">{{ item.dynasty }}</span>
              <span class="tag tag--teal">{{ item.type }}</span>
            </div>
            <h3>{{ item.name }}</h3>
            <p>{{ item.description }}</p>
            <RouterLink :to="`/artifacts/${item.id}`" class="button button--secondary">查看详情</RouterLink>
          </div>
        </article>
      </div>
    </section>
  </template>

  <section v-else class="section">
    <div class="empty">未找到对应文物。</div>
  </section>
</template>
