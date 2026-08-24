<script setup>
import { computed, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import * as echarts from 'echarts'
import { ElCard } from 'element-plus'

const props = defineProps({
  title: {
    type: String,
    required: true,
  },
  subtitle: {
    type: String,
    default: '',
  },
  option: {
    type: Object,
    required: true,
  },
  height: {
    type: [Number, String],
    default: 320,
  },
  tone: {
    type: String,
    default: 'blue',
  },
})

const chartRef = ref(null)
let chartInstance = null
let resizeObserver = null

const chartHeight = computed(() =>
  typeof props.height === 'number' ? `${props.height}px` : props.height,
)

function renderChart() {
  if (!chartInstance) return
  chartInstance.setOption(props.option, true)
}

function handleResize() {
  chartInstance?.resize()
}

onMounted(() => {
  chartInstance = echarts.init(chartRef.value)
  renderChart()
  resizeObserver = new ResizeObserver(handleResize)
  resizeObserver.observe(chartRef.value)
  window.addEventListener('resize', handleResize)
})

watch(
  () => props.option,
  () => renderChart(),
  { deep: true },
)

onBeforeUnmount(() => {
  resizeObserver?.disconnect()
  window.removeEventListener('resize', handleResize)
  chartInstance?.dispose()
})
</script>

<template>
  <el-card
    :class="['insight-chart-card', 'dashboard-card', `insight-chart-card--${tone}`]"
    shadow="never"
  >
    <template #header>
      <div class="chart-head">
        <div>
          <div class="chart-title">{{ title }}</div>
          <div class="chart-subtitle">{{ subtitle }}</div>
        </div>
        <slot name="extra" />
      </div>
    </template>

    <div ref="chartRef" class="chart-box" :style="{ height: chartHeight }"></div>
  </el-card>
</template>
