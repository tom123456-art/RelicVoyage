<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import {
  getArtifactsByMuseumId,
  getMuseumById,
} from '@/data/mock'

const route = useRoute()

const museum = computed(() => getMuseumById(route.params.id))
const collection = computed(() =>
  museum.value ? getArtifactsByMuseumId(museum.value.id) : [],
)
</script>

<template>
  <section v-if="museum" class="detail-layout">
    <article class="detail-panel">
      <div class="media-frame">
        <img :src="museum.imageUrl || museum.image" :alt="museum.name" class="card-media" />
      </div>

      <div class="museum-map" style="margin-top: 1rem">
        <div class="museum-map__pin"></div>
      </div>

      <div class="tag-row" style="margin-top: 1rem">
        <span class="tag">{{ museum.city }}</span>
        <span class="tag tag--teal">{{ museum.openTime }}</span>
      </div>
    </article>

    <aside class="detail-panel">
      <p class="eyebrow">博物馆详情</p>
      <h1 style="margin: 0 0 0.5rem; font-family: 'Source Han Serif SC', 'Noto Serif SC', 'Songti SC', serif">
        {{ museum.name }}
      </h1>
      <p class="lead">{{ museum.intro }}</p>

      <div class="info-list" style="margin-top: 1rem">
        <div class="info-row">
          <span>城市</span>
          <strong>{{ museum.city }}</strong>
        </div>
        <div class="info-row">
          <span>地址</span>
          <strong>{{ museum.address }}</strong>
        </div>
        <div class="info-row">
          <span>开放时间</span>
          <strong>{{ museum.openTime }}</strong>
        </div>
      </div>

      <div class="button-row" style="margin-top: 1rem">
        <button type="button" class="button button--primary">导航</button>
      </div>
    </aside>
  </section>

  <section class="section">
    <div class="section-header">
      <div>
        <h2>馆藏文物</h2>
        <p>该馆收录的精选文物。</p>
      </div>
    </div>

    <div class="card-grid">
      <article v-for="item in collection" :key="item.id" class="card">
        <img :src="item.imageUrl || item.image" :alt="item.name" class="card-media" />
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
