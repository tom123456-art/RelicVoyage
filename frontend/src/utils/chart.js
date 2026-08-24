import * as echarts from 'echarts'

const axisText = {
  color: '#657570',
  fontSize: 12,
}

const axisLine = {
  lineStyle: {
    color: 'rgba(38, 59, 58, 0.16)',
  },
}

const splitLine = {
  lineStyle: {
    color: 'rgba(38, 59, 58, 0.08)',
  },
}

const baseGrid = {
  left: 18,
  right: 18,
  top: 56,
  bottom: 18,
  containLabel: true,
}

const tooltip = {
  backgroundColor: 'rgba(244, 246, 240, 0.98)',
  borderColor: 'rgba(38, 59, 58, 0.14)',
  borderWidth: 1,
  padding: [10, 12],
  textStyle: {
    color: '#2d4542',
    fontSize: 12,
  },
  extraCssText: 'box-shadow: 0 12px 28px rgba(42, 63, 61, 0.16); border-radius: 12px;',
}

function hexToRgb(hex) {
  const normalized = hex.replace('#', '')
  const value = normalized.length === 3
    ? normalized
        .split('')
        .map((char) => char + char)
        .join('')
    : normalized

  const integer = Number.parseInt(value, 16)
  return {
    r: (integer >> 16) & 255,
    g: (integer >> 8) & 255,
    b: integer & 255,
  }
}

function withAlpha(hex, alpha) {
  const { r, g, b } = hexToRgb(hex)
  return `rgba(${r}, ${g}, ${b}, ${alpha})`
}

function buildVerticalGradient(color) {
  return new echarts.graphic.LinearGradient(0, 0, 0, 1, [
    { offset: 0, color: withAlpha(color, 0.98) },
    { offset: 1, color: withAlpha(color, 0.5) },
  ])
}

function buildHorizontalGradient(color) {
  return new echarts.graphic.LinearGradient(0, 0, 1, 0, [
    { offset: 0, color: withAlpha(color, 0.72) },
    { offset: 1, color },
  ])
}

function buildCenterGraphic(centerLabel) {
  if (!centerLabel) {
    return undefined
  }

  return [
    {
      type: 'group',
      left: 'center',
      top: '36%',
      children: [
        {
          type: 'text',
          left: 'center',
          top: 0,
          style: {
            text: centerLabel.value,
            fill: '#2d4542',
            fontSize: 24,
            fontWeight: 700,
            textAlign: 'center',
          },
        },
        {
          type: 'text',
          left: 'center',
          top: 30,
          style: {
            text: centerLabel.label,
            fill: '#73837f',
            fontSize: 12,
            textAlign: 'center',
          },
        },
      ],
    },
  ]
}

export function buildAreaLineOption({ labels, leftName, leftData, rightName, rightData, colors }) {
  return {
    color: colors,
    tooltip: {
      ...tooltip,
      trigger: 'axis',
    },
    legend: {
      top: 8,
      itemWidth: 10,
      itemHeight: 10,
      icon: 'circle',
      textStyle: axisText,
    },
    grid: baseGrid,
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: labels,
      axisLabel: axisText,
      axisLine,
      axisTick: { show: false },
    },
    yAxis: {
      type: 'value',
      axisLabel: axisText,
      splitLine,
    },
    series: [
      {
        name: leftName,
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 8,
        data: leftData,
        lineStyle: {
          width: 3,
          color: colors[0],
        },
        itemStyle: {
          color: colors[0],
            borderColor: '#edf1eb',
          borderWidth: 2,
        },
        areaStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: withAlpha(colors[0], 0.34) },
            { offset: 1, color: withAlpha(colors[0], 0.06) },
          ]),
        },
      },
      {
        name: rightName,
        type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 8,
        data: rightData,
        lineStyle: {
          width: 3,
          color: colors[1],
        },
        itemStyle: {
          color: colors[1],
            borderColor: '#edf1eb',
          borderWidth: 2,
        },
        areaStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: withAlpha(colors[1], 0.28) },
            { offset: 1, color: withAlpha(colors[1], 0.06) },
          ]),
        },
      },
    ],
  }
}

export function buildPieOption({
  title,
  data,
  colors,
  radius = ['50%', '72%'],
  center = ['50%', '44%'],
  roseType = false,
  centerLabel = null,
}) {
  return {
    color: colors,
    tooltip: {
      ...tooltip,
      trigger: 'item',
    },
    legend: {
      bottom: 2,
      icon: 'circle',
      itemWidth: 10,
      itemHeight: 10,
      textStyle: axisText,
    },
    graphic: buildCenterGraphic(centerLabel),
    series: [
      {
        name: title,
        type: 'pie',
        radius,
        center,
        roseType,
        avoidLabelOverlap: true,
        itemStyle: {
          borderColor: '#edf1eb',
          borderWidth: 3,
          borderRadius: 10,
        },
        label: {
          show: false,
        },
        emphasis: {
          scale: true,
          scaleSize: 8,
          itemStyle: {
            shadowBlur: 18,
            shadowColor: 'rgba(42, 63, 61, 0.16)',
          },
        },
        data,
      },
    ],
  }
}

export function buildHorizontalBarOption({ labels, values, color, name }) {
  return {
    tooltip: {
      ...tooltip,
      trigger: 'axis',
      axisPointer: {
        type: 'shadow',
      },
    },
    grid: {
      left: 120,
      right: 18,
      top: 20,
      bottom: 18,
      containLabel: true,
    },
    xAxis: {
      type: 'value',
      axisLabel: axisText,
      splitLine,
    },
    yAxis: {
      type: 'category',
      data: labels,
      axisLabel: axisText,
      axisLine,
      axisTick: { show: false },
    },
    series: [
      {
        name,
        type: 'bar',
        data: values,
        barWidth: 14,
        itemStyle: {
          color: buildHorizontalGradient(color),
          borderRadius: [0, 10, 10, 0],
        },
        showBackground: true,
        backgroundStyle: {
          color: withAlpha(color, 0.08),
          borderRadius: [0, 10, 10, 0],
        },
      },
    ],
  }
}

export function buildColumnBarOption({ labels, values, color, name, barWidth = 18 }) {
  return {
    tooltip: {
      ...tooltip,
      trigger: 'axis',
      axisPointer: {
        type: 'shadow',
      },
    },
    grid: baseGrid,
    xAxis: {
      type: 'category',
      data: labels,
      axisLabel: axisText,
      axisLine,
      axisTick: { show: false },
    },
    yAxis: {
      type: 'value',
      axisLabel: axisText,
      splitLine,
    },
    series: [
      {
        name,
        type: 'bar',
        data: values,
        barWidth,
        itemStyle: {
          color: buildVerticalGradient(color),
          borderRadius: [12, 12, 4, 4],
        },
        showBackground: true,
        backgroundStyle: {
          color: withAlpha(color, 0.08),
          borderRadius: [12, 12, 4, 4],
        },
      },
    ],
  }
}

export function buildRadarOption({ indicators, values, name, color, areaColor }) {
  return {
    tooltip,
    radar: {
      indicator: indicators,
      radius: '64%',
      splitNumber: 4,
      axisName: {
        color: '#657570',
        fontSize: 12,
      },
      splitArea: {
        areaStyle: {
          color: [
            'rgba(246, 247, 241, 0.86)',
            'rgba(234, 239, 233, 0.72)',
            'rgba(219, 229, 222, 0.58)',
            'rgba(205, 219, 211, 0.44)',
          ],
        },
      },
      splitLine: {
        lineStyle: {
          color: 'rgba(38, 59, 58, 0.1)',
        },
      },
      axisLine: {
        lineStyle: {
          color: 'rgba(38, 59, 58, 0.1)',
        },
      },
    },
    series: [
      {
        name,
        type: 'radar',
        symbol: 'circle',
        symbolSize: 6,
        data: [
          {
            value: values,
            name,
            lineStyle: {
              color,
              width: 3,
            },
            itemStyle: {
              color,
            },
            areaStyle: {
              color: areaColor,
            },
          },
        ],
      },
    ],
  }
}
