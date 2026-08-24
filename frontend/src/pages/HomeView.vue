<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElButton, ElCard, ElCol, ElRow, ElTimeline, ElTimelineItem } from 'element-plus'
import { artifacts, userDashboard } from '@/data/mock'
import InsightChart from '@/components/InsightChart.vue'
import { getSession } from '@/utils/session'
import {
  buildAreaLineOption,
  buildColumnBarOption,
  buildHorizontalBarOption,
  buildPieOption,
  buildRadarOption,
} from '@/utils/chart'

const router = useRouter()

const currentSession = computed(() => getSession())
const displayName = computed(() => currentSession.value?.username ?? '当前用户')

const recommendedArtifacts = computed(() =>
  userDashboard.recommendedArtifactIds
    .map((id) => artifacts.find((item) => item.id === id))
    .filter(Boolean),
)

const typeDistribution = computed(() => {
  const bucket = new Map()

  recommendedArtifacts.value.forEach((item) => {
    bucket.set(item.type, (bucket.get(item.type) ?? 0) + 1)
  })

  return Array.from(bucket.entries()).map(([name, value]) => ({ name, value }))
})

const trendOption = computed(() =>
  buildAreaLineOption({
    labels: userDashboard.browseTrend.labels,
    leftName: '浏览量',
    leftData: userDashboard.browseTrend.views,
    rightName: '收藏量',
    rightData: userDashboard.browseTrend.favorites,
    colors: ['#2f80ed', '#e14d4d'],
  }),
)

const dynastyOption = computed(() =>
  buildPieOption({
    title: '朝代偏好',
    data: userDashboard.dynastyPreference,
    colors: ['#2f80ed', '#e14d4d', '#00a7c4', '#365dcc', '#c83846'],
    centerLabel: {
      value: `${userDashboard.dynastyPreference.length}`,
      label: '偏好维度',
    },
  }),
)

const museumOption = computed(() =>
  buildHorizontalBarOption({
    labels: userDashboard.museumVisits.map((item) => item.name),
    values: userDashboard.museumVisits.map((item) => item.value),
    color: '#00a7c4',
    name: '访问次数',
  }),
)

const artifactHeatOption = computed(() =>
  buildColumnBarOption({
    labels: recommendedArtifacts.value.map((item) => item.name),
    values: recommendedArtifacts.value.map((item) => item.favoriteCount),
    color: '#e14d4d',
    name: '收藏数',
  }),
)

const profileRadarOption = computed(() => {
  const totalViews = userDashboard.browseTrend.views.reduce((sum, item) => sum + item, 0)
  const totalFavorites = userDashboard.browseTrend.favorites.reduce((sum, item) => sum + item, 0)
  const highestMuseumVisit = Math.max(...userDashboard.museumVisits.map((item) => item.value))

  return buildRadarOption({
    name: '探索画像',
    indicators: [
      { name: '浏览活跃', max: 100 },
      { name: '收藏转化', max: 100 },
      { name: '场馆关注', max: 100 },
      { name: '偏好多样', max: 100 },
      { name: '回访稳定', max: 100 },
    ],
    values: [
      Math.min(100, Math.round(totalViews / 2.2)),
      Math.min(100, Math.round((totalFavorites / totalViews) * 480)),
      Math.min(100, Math.round(highestMuseumVisit * 2.2)),
      Math.min(100, Math.round((typeDistribution.value.length / 4) * 100)),
      Math.min(100, Math.round((userDashboard.activityFeed.length / 4) * 100)),
    ],
    color: '#365dcc',
    areaColor: 'rgba(54, 93, 204, 0.22)',
  })
})

const typeOption = computed(() =>
  buildPieOption({
    title: '内容类型',
    data: typeDistribution.value,
    colors: ['#2f80ed', '#00a7c4', '#d64550', '#365dcc'],
    radius: ['30%', '72%'],
    roseType: 'radius',
  }),
)
</script>

<template>
  <section class="dashboard-hero">
    <el-card class="dashboard-card dashboard-hero-card" shadow="never">
      <div class="hero-top">
        <div class="hero-copy">
          <p class="eyebrow">用户总览</p>
          <h1>{{ displayName }}，浏览、收藏和关注热点都在这一屏里</h1>
          <p class="lead">图表优先，少解释，直接看变化。</p>
          <div class="hero-actions">
            <el-button type="primary" round @click="router.push('/artifacts')">浏览文物</el-button>
            <el-button round @click="router.push('/museums')">查看博物馆</el-button>
          </div>
        </div>

        <div class="hero-stats">
          <el-card
            v-for="item in userDashboard.metrics"
            :key="item.label"
            class="metric-card"
            shadow="never"
          >
            <span class="metric-label">{{ item.label }}</span>
            <strong class="metric-value">{{ item.value }}</strong>
            <span class="metric-delta">{{ item.delta }}</span>
          </el-card>
        </div>
      </div>
    </el-card>
  </section>

  <section class="dashboard-section">
    <div class="section-header">
      <div>
        <h2>行为趋势</h2>
        <p>本周行为变化。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="14">
        <InsightChart
          title="访问趋势"
          subtitle="本周浏览量与收藏量变化"
          :option="trendOption"
          :height="340"
          tone="blue"
        >
          <template #extra>
            <span class="chart-chip">近 7 天</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="10">
        <InsightChart
          title="朝代偏好"
          subtitle="当前收藏内容的朝代分布"
          :option="dynastyOption"
          :height="340"
          tone="green"
        >
          <template #extra>
            <span class="chart-chip">偏好分布</span>
          </template>
        </InsightChart>
      </el-col>
    </el-row>
  </section>

  <section class="dashboard-section">
    <div class="section-header">
      <div>
        <h2>热点分布</h2>
        <p>常看场馆与推荐热度。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="常看博物馆"
          subtitle="最近访问频率更高的场馆"
          :option="museumOption"
          :height="340"
          tone="cyan"
        >
          <template #extra>
            <span class="chart-chip">访问排行</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="热门文物"
          subtitle="推荐内容中的收藏热度"
          :option="artifactHeatOption"
          :height="340"
          tone="amber"
        >
          <template #extra>
            <span class="chart-chip">推荐池</span>
          </template>
        </InsightChart>
      </el-col>
    </el-row>
  </section>

  <section class="dashboard-section">
    <div class="section-header">
      <div>
        <h2>偏好画像</h2>
        <p>把浏览偏好拆开看。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="探索画像"
          subtitle="浏览、收藏、场馆关注与回访稳定度"
          :option="profileRadarOption"
          :height="340"
          tone="violet"
        >
          <template #extra>
            <span class="chart-chip">用户侧</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="内容类型"
          subtitle="推荐内容里的类型分布"
          :option="typeOption"
          :height="340"
          tone="rose"
        >
          <template #extra>
            <span class="chart-chip">推荐结构</span>
          </template>
        </InsightChart>
      </el-col>
    </el-row>
  </section>

  <section class="dashboard-section">
    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="24">
        <el-card class="dashboard-card" shadow="never">
          <template #header>
            <div class="section-header section-header--compact">
              <div>
                <h2>最近动态</h2>
                <p>最近的浏览与收藏记录。</p>
              </div>
            </div>
          </template>

          <el-timeline class="activity-timeline">
            <el-timeline-item
              v-for="item in userDashboard.activityFeed"
              :key="`${item.time}-${item.title}`"
              :timestamp="item.time"
              placement="top"
            >
              <div class="timeline-title">{{ item.title }}</div>
              <div class="timeline-detail">{{ item.detail }}</div>
            </el-timeline-item>
          </el-timeline>
        </el-card>
      </el-col>
    </el-row>
  </section>
</template>
