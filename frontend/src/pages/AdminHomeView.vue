<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElButton, ElCard, ElCol, ElRow, ElTable, ElTableColumn } from 'element-plus'
import { adminDashboard } from '@/data/mock'
import InsightChart from '@/components/InsightChart.vue'
import {
  buildAreaLineOption,
  buildColumnBarOption,
  buildPieOption,
  buildRadarOption,
} from '@/utils/chart'

const router = useRouter()

const actionDistribution = computed(() => {
  const bucket = new Map()

  adminDashboard.recentOperations.forEach((item) => {
    bucket.set(item.action, (bucket.get(item.action) ?? 0) + 1)
  })

  return Array.from(bucket.entries()).map(([name, value]) => ({ name, value }))
})

const activeRate = computed(() => {
  const total = adminDashboard.userStatus.reduce((sum, item) => sum + item.value, 0)
  const active = adminDashboard.userStatus.find((item) => item.name === '启用')?.value ?? 0
  return total ? Math.round((active / total) * 100) : 0
})

const dynastyOption = computed(() =>
  buildColumnBarOption({
    labels: adminDashboard.artifactByDynasty.map((item) => item.name),
    values: adminDashboard.artifactByDynasty.map((item) => item.value),
    color: '#2f80ed',
    name: '文物数量',
  }),
)

const cityOption = computed(() =>
  buildPieOption({
    title: '城市分布',
    data: adminDashboard.museumByCity,
    colors: ['#2f80ed', '#00a7c4', '#4d8dff', '#e14d4d'],
    radius: ['34%', '74%'],
    roseType: 'radius',
  }),
)

const growthOption = computed(() =>
  buildAreaLineOption({
    labels: adminDashboard.monthlyGrowth.labels,
    leftName: '文物新增',
    leftData: adminDashboard.monthlyGrowth.artifacts,
    rightName: '博物馆更新',
    rightData: adminDashboard.monthlyGrowth.museums,
    colors: ['#e14d4d', '#00a7c4'],
  }),
)

const actionOption = computed(() =>
  buildColumnBarOption({
    labels: actionDistribution.value.map((item) => item.name),
    values: actionDistribution.value.map((item) => item.value),
    color: '#e14d4d',
    name: '操作次数',
    barWidth: 26,
  }),
)

const governanceOption = computed(() =>
  buildRadarOption({
    name: '治理画像',
    indicators: [
      { name: '文物维护', max: 100 },
      { name: '场馆维护', max: 100 },
      { name: '内容增长', max: 100 },
      { name: '账号活跃', max: 100 },
      { name: '状态稳定', max: 100 },
    ],
    values: [88, 76, 84, 92, 78],
    color: '#365dcc',
    areaColor: 'rgba(54, 93, 204, 0.22)',
  }),
)

const statusOption = computed(() =>
  buildPieOption({
    title: '用户状态',
    data: adminDashboard.userStatus,
    colors: ['#00a7c4', '#d64550'],
    centerLabel: {
      value: `${activeRate.value}%`,
      label: '启用占比',
    },
  }),
)
</script>

<template>
  <section class="dashboard-hero">
    <el-card class="dashboard-card dashboard-hero-card" shadow="never">
      <div class="hero-top hero-top--admin">
        <div class="hero-copy">
          <p class="eyebrow">管理总览</p>
          <h1>文物、博物馆、角色状态和操作节奏都集中到一个总览页</h1>
          <p class="lead">图表优先，直接看结构、增长和治理状态。</p>
          <div class="hero-actions">
            <el-button type="primary" round @click="router.push('/admin/artifacts')">文物管理</el-button>
            <el-button round @click="router.push('/admin/museums')">博物馆管理</el-button>
            <el-button round @click="router.push('/admin/users')">用户管理</el-button>
          </div>
        </div>

        <div class="hero-stats">
          <el-card
            v-for="item in adminDashboard.metrics"
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
        <h2>内容分布</h2>
        <p>先看结构，再看问题在哪一层。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="文物朝代分布"
          subtitle="按朝代查看当前文物结构"
          :option="dynastyOption"
          :height="340"
          tone="blue"
        >
          <template #extra>
            <span class="chart-chip">馆藏结构</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="博物馆城市分布"
          subtitle="按城市查看场馆覆盖"
          :option="cityOption"
          :height="340"
          tone="cyan"
        >
          <template #extra>
            <span class="chart-chip">城市覆盖</span>
          </template>
        </InsightChart>
      </el-col>
    </el-row>
  </section>

  <section class="dashboard-section">
    <div class="section-header">
      <div>
        <h2>增长与操作</h2>
        <p>把更新节奏和后台操作拆开看。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="月度内容增长"
          subtitle="近六个月文物与博物馆更新变化"
          :option="growthOption"
          :height="340"
          tone="violet"
        >
          <template #extra>
            <span class="chart-chip">近 6 月</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="操作类型分布"
          subtitle="最近操作以什么动作居多"
          :option="actionOption"
          :height="340"
          tone="amber"
        >
          <template #extra>
            <span class="chart-chip">操作统计</span>
          </template>
        </InsightChart>
      </el-col>
    </el-row>
  </section>

  <section class="dashboard-section">
    <div class="section-header">
      <div>
        <h2>治理状态</h2>
        <p>角色状态和整体维护强度。</p>
      </div>
    </div>

    <el-row :gutter="16" class="dashboard-row">
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="治理画像"
          subtitle="从维护、增长、活跃和稳定度看整体状态"
          :option="governanceOption"
          :height="340"
          tone="rose"
        >
          <template #extra>
            <span class="chart-chip">后台侧</span>
          </template>
        </InsightChart>
      </el-col>
      <el-col :xs="24" :lg="12">
        <InsightChart
          title="用户状态"
          subtitle="启用与禁用占比"
          :option="statusOption"
          :height="340"
          tone="green"
        >
          <template #extra>
            <span class="chart-chip">账号状态</span>
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
                <h2>最近操作</h2>
                <p>最近一轮维护记录。</p>
              </div>
            </div>
          </template>

          <el-table :data="adminDashboard.recentOperations" stripe>
            <el-table-column prop="time" label="时间" width="100" />
            <el-table-column prop="actor" label="操作人" width="140" />
            <el-table-column prop="action" label="动作" width="120" />
            <el-table-column prop="target" label="对象" />
            <el-table-column prop="result" label="结果" width="140" />
          </el-table>
        </el-card>
      </el-col>
    </el-row>
  </section>
</template>
