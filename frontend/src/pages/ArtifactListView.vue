<script setup>
import { computed, onMounted, reactive, ref } from 'vue'
import { endpoints } from '@/data/endpoints'
import { fetchArtifacts, resolveArtifactImage } from '@/api/artifacts'

const filters = reactive({
  keyword: '',
  dynasty: '全部',
  material: '全部',
  type: '全部',
})

const loading = ref(false)
const error = ref('')
const artifacts = ref([])

const noop = () => {}

const dynastyOptions = computed(() => ['全部', ...new Set(artifacts.value.map((item) => item.dynasty).filter(Boolean))])
const materialOptions = computed(() => ['全部', ...new Set(artifacts.value.map((item) => item.material).filter(Boolean))])
const typeOptions = computed(() => ['全部', ...new Set(artifacts.value.map((item) => item.type).filter(Boolean))])

const filteredArtifacts = computed(() =>
  artifacts.value.filter((item) => {
    const keyword = filters.keyword.trim().toLowerCase()
    const keywordMatch =
      !keyword ||
      item.name?.toLowerCase().includes(keyword) ||
      item.origin?.toLowerCase().includes(keyword) ||
      item.museumName?.toLowerCase().includes(keyword) ||
      item.description?.toLowerCase().includes(keyword)

    const dynastyMatch = filters.dynasty === '全部' || item.dynasty === filters.dynasty
    const materialMatch = filters.material === '全部' || item.material === filters.material
    const typeMatch = filters.type === '全部' || item.type === filters.type

    return keywordMatch && dynastyMatch && materialMatch && typeMatch
  }),
)

async function loadArtifacts() {
  loading.value = true
  error.value = ''

  try {
    artifacts.value = await fetchArtifacts()
  } catch (err) {
    error.value = '文物数据加载失败，请检查后端服务和数据库连接。'
    console.error(err)
  } finally {
    loading.value = false
  }
}

function resetSearch() {
  filters.keyword = ''
  filters.dynasty = '全部'
  filters.material = '全部'
  filters.type = '全部'
}

onMounted(loadArtifacts)
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>文物总览</strong>
        <p>按朝代、材质与类型浏览馆藏内容。</p>
      </div>
    </div>

    <div class="layout">
      <aside class="filter-card">
        <form class="form" :action="endpoints.artifacts.search" method="get" @submit.prevent="noop">
          <div class="field">
            <label class="label" for="artifact-keyword">关键词</label>
            <input
              id="artifact-keyword"
              v-model="filters.keyword"
              class="input"
              name="keyword"
              placeholder="名称、出土地、博物馆"
            />
          </div>

          <div class="field">
            <label class="label" for="artifact-dynasty">朝代</label>
            <select id="artifact-dynasty" v-model="filters.dynasty" class="select" name="dynasty">
              <option v-for="item in dynastyOptions" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="field">
            <label class="label" for="artifact-material">材质</label>
            <select id="artifact-material" v-model="filters.material" class="select" name="material">
              <option v-for="item in materialOptions" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="field">
            <label class="label" for="artifact-type">类型</label>
            <select id="artifact-type" v-model="filters.type" class="select" name="type">
              <option v-for="item in typeOptions" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="button-row">
            <button class="button button--primary" type="submit">筛选</button>
            <button class="button button--ghost" type="button" @click="resetSearch">重置</button>
          </div>
        </form>
      </aside>

      <div v-if="loading" class="empty">文物数据加载中...</div>
      <div v-else-if="error" class="empty">{{ error }}</div>
      <div v-else-if="!filteredArtifacts.length" class="empty">当前筛选条件下没有文物数据。</div>

      <div v-else class="card-grid">
        <article v-for="item in filteredArtifacts" :key="item.id" class="card">
          <img :src="resolveArtifactImage(item.imageUrl)" :alt="item.name" class="card-media" />
          <div class="card-body">
            <div class="tag-row">
              <span class="tag">{{ item.dynasty }}</span>
              <span class="tag tag--teal">{{ item.type }}</span>
            </div>
            <h3>{{ item.name }}</h3>
            <p>{{ item.description }}</p>
            <div class="card-meta">
              <span>{{ item.museumName }}</span>
              <span>{{ item.origin }}</span>
              <span class="artifact-popularity">
                <span>收藏人数</span>
                <strong>{{ item.favoriteCount }}</strong>
              </span>
            </div>
            <div class="button-row">
              <RouterLink :to="`/artifacts/${item.id}`" class="button button--secondary">详情</RouterLink>
              <form :action="endpoints.artifacts.favoriteAdd" method="post" @submit.prevent="noop">
                <input type="hidden" name="artifactId" :value="item.id" />
                <button type="submit" class="button button--primary">
                  收藏
                  <span class="button-count">{{ item.favoriteCount }}</span>
                </button>
              </form>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
