<script setup>
import { computed, reactive } from 'vue'
import { museums } from '@/data/mock'
import { endpoints } from '@/data/endpoints'

const filters = reactive({
  keyword: '',
  city: '全部',
})

const noop = () => {}

const cityOptions = computed(() => ['全部', ...new Set(museums.map((item) => item.city))])

const filteredMuseums = computed(() =>
  museums.filter((item) => {
    const keyword = filters.keyword.trim().toLowerCase()
    const keywordMatch =
      !keyword ||
      item.name.toLowerCase().includes(keyword) ||
      item.address.toLowerCase().includes(keyword) ||
      item.intro.toLowerCase().includes(keyword)
    const cityMatch = filters.city === '全部' || item.city === filters.city
    return keywordMatch && cityMatch
  }),
)

function resetSearch() {
  filters.keyword = ''
  filters.city = '全部'
}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>博物馆总览</strong>
        <p>按城市与关键词浏览场馆信息。</p>
      </div>
    </div>

    <div class="layout">
      <aside class="filter-card">
        <form class="form" :action="endpoints.museums.search" method="get" @submit.prevent="noop">
          <div class="field">
            <label class="label" for="museum-keyword">关键词</label>
            <input
              id="museum-keyword"
              v-model="filters.keyword"
              class="input"
              name="keyword"
              placeholder="名称、地址、简介"
            />
          </div>

          <div class="field">
            <label class="label" for="museum-city">城市</label>
            <select id="museum-city" v-model="filters.city" class="select" name="city">
              <option v-for="item in cityOptions" :key="item" :value="item">
                {{ item }}
              </option>
            </select>
          </div>

          <div class="button-row">
            <button type="submit" class="button button--primary">筛选</button>
            <button type="button" class="button button--ghost" @click="resetSearch">重置</button>
          </div>
        </form>
      </aside>

      <div class="card-grid">
        <article v-for="item in filteredMuseums" :key="item.id" class="card card--wide">
          <img :src="item.imageUrl || item.image" :alt="item.name" class="card-media" />
          <div class="card-body">
            <div class="tag-row">
              <span class="tag">{{ item.city }}</span>
              <span class="tag tag--teal">{{ item.openTime }}</span>
            </div>
            <h3>{{ item.name }}</h3>
            <p>{{ item.intro }}</p>
            <div class="card-meta">
              <span>{{ item.address }}</span>
            </div>
            <RouterLink :to="`/museums/${item.id}`" class="button button--secondary">查看详情</RouterLink>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>
