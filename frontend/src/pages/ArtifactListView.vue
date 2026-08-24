<script setup>
import { computed, reactive } from 'vue'
import { artifacts, artifactFilters } from '@/data/mock'
import { endpoints } from '@/data/endpoints'

const filters = reactive({
  keyword: '',
  dynasty: '全部',
  material: '全部',
  type: '全部',
})

const noop = () => {}

const filteredArtifacts = computed(() =>
  artifacts.filter((item) => {
    const keyword = filters.keyword.trim().toLowerCase()
    const keywordMatch =
      !keyword ||
      item.name.toLowerCase().includes(keyword) ||
      item.origin.toLowerCase().includes(keyword) ||
      item.museumName.toLowerCase().includes(keyword)
    const dynastyMatch = filters.dynasty === '全部' || item.dynasty === filters.dynasty
    const materialMatch = filters.material === '全部' || item.material === filters.material
    const typeMatch = filters.type === '全部' || item.type === filters.type
    return keywordMatch && dynastyMatch && materialMatch && typeMatch
  }),
)

function resetSearch() {
  filters.keyword = ''
  filters.dynasty = '全部'
  filters.material = '全部'
  filters.type = '全部'
}
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
              placeholder="名称、出土地点、博物馆"
            />
          </div>

          <div class="field">
            <label class="label" for="artifact-dynasty">朝代</label>
            <select id="artifact-dynasty" v-model="filters.dynasty" class="select" name="dynasty">
              <option v-for="item in artifactFilters.dynasties" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="field">
            <label class="label" for="artifact-material">材质</label>
            <select id="artifact-material" v-model="filters.material" class="select" name="material">
              <option v-for="item in artifactFilters.materials" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="field">
            <label class="label" for="artifact-type">类型</label>
            <select id="artifact-type" v-model="filters.type" class="select" name="type">
              <option v-for="item in artifactFilters.types" :key="item" :value="item">
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

      <div class="card-grid">
        <article v-for="item in filteredArtifacts" :key="item.id" class="card">
          <img :src="item.imageUrl || item.image" :alt="item.name" class="card-media" />
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
              <span>收藏 {{ item.favoriteCount }}</span>
            </div>
            <div class="button-row">
              <RouterLink :to="`/artifacts/${item.id}`" class="button button--secondary">详情</RouterLink>
              <form :action="endpoints.artifacts.favoriteAdd" method="post" @submit.prevent="noop">
                <input type="hidden" name="artifactId" :value="item.id" />
                <button type="submit" class="button button--primary">收藏</button>
              </form>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
