import { reactive } from 'vue'

function withImage(record, folder, file) {
  const imageUrl = `/${folder}/${file}`
  return {
    ...record,
    imageUrl,
    image: imageUrl,
  }
}

export const artifactFilters = {
  dynasties: ['全部', '西周', '汉', '唐', '宋', '元', '明', '清'],
  materials: ['全部', '青铜', '陶器', '瓷器', '玉器', '书画', '金属', '织绣'],
  types: ['全部', '礼器', '陶俑', '瓷器', '玉器', '书画', '香炉', '陈设器'],
}

export const artifacts = [
  withImage(
    {
      id: 1,
      name: '青铜云纹鼎',
      dynasty: '西周',
      material: '青铜',
      type: '礼器',
      origin: '陕西宝鸡',
      museumId: 1,
      museumName: '国家历史博物馆',
      favoriteCount: 128,
      description: '鼎身饰以云雷纹和兽面纹，器形稳重，是西周青铜礼器风格的典型代表。',
    },
    'artifacts',
    'bronze-ding.svg',
  ),
  withImage(
    {
      id: 2,
      name: '唐三彩载物骆驼',
      dynasty: '唐',
      material: '陶器',
      type: '陶俑',
      origin: '洛阳',
      museumId: 2,
      museumName: '中原博物馆',
      favoriteCount: 96,
      description: '色彩浓艳、造型饱满，常用于表现丝绸之路背景下的交通与商贸场景。',
    },
    'artifacts',
    'sancai-camel.svg',
  ),
  withImage(
    {
      id: 3,
      name: '龙泉青瓷梅瓶',
      dynasty: '宋',
      material: '瓷器',
      type: '瓷器',
      origin: '浙江龙泉',
      museumId: 3,
      museumName: '江南青瓷馆',
      favoriteCount: 214,
      description: '釉色温润内敛，瓶体修长克制，体现了宋代青瓷审美的雅致气质。',
    },
    'artifacts',
    'longquan-meiping.svg',
  ),
  withImage(
    {
      id: 4,
      name: '仕女图卷',
      dynasty: '唐',
      material: '书画',
      type: '书画',
      origin: '长安',
      museumId: 1,
      museumName: '国家历史博物馆',
      favoriteCount: 87,
      description: '线条流畅、人物姿态从容，用于展示盛唐仕女画的衣饰与气韵之美。',
    },
    'artifacts',
    'ladies-scroll.svg',
  ),
  withImage(
    {
      id: 5,
      name: '鎏金香炉',
      dynasty: '明',
      material: '金属',
      type: '香炉',
      origin: '北京',
      museumId: 2,
      museumName: '中原博物馆',
      favoriteCount: 61,
      description: '器表鎏金层次清晰，纹饰繁密工整，兼具陈设与礼仪功能。',
    },
    'artifacts',
    'gilded-censer.svg',
  ),
  withImage(
    {
      id: 6,
      name: '汉代玉璧',
      dynasty: '汉',
      material: '玉器',
      type: '玉器',
      origin: '满城',
      museumId: 3,
      museumName: '江南青瓷馆',
      favoriteCount: 173,
      description: '玉质细腻、打磨圆润，反映了汉代礼制玉器的庄重与秩序感。',
    },
    'artifacts',
    'han-jade-bi.svg',
  ),
  withImage(
    {
      id: 7,
      name: '元青花大盘',
      dynasty: '元',
      material: '瓷器',
      type: '陈设器',
      origin: '景德镇',
      museumId: 4,
      museumName: '海上艺术陈列馆',
      favoriteCount: 145,
      description: '青花发色沉稳，器面绘饰层次分明，是外销瓷叙事与工艺结合的代表。',
    },
    'artifacts',
    'yuan-blue-plate.svg',
  ),
  withImage(
    {
      id: 8,
      name: '清代珐琅彩瓶',
      dynasty: '清',
      material: '瓷器',
      type: '陈设器',
      origin: '景德镇',
      museumId: 4,
      museumName: '海上艺术陈列馆',
      favoriteCount: 104,
      description: '设色繁丽而收敛，常用于表现宫廷陈设瓷器在工艺与审美上的成熟度。',
    },
    'artifacts',
    'famille-rose-vase.svg',
  ),
]

export const museums = [
  withImage(
    {
      id: 1,
      name: '国家历史博物馆',
      city: '北京',
      address: '北京市东城区文化路 18 号',
      openTime: '09:00 - 17:30',
      longitude: '116.404',
      latitude: '39.915',
      intro: '以中国古代礼制、书画与重要出土文物为主线，适合作为首页核心馆藏入口。',
      artifactIds: [1, 4],
    },
    'museums',
    'national-history-museum.svg',
  ),
  withImage(
    {
      id: 2,
      name: '中原博物馆',
      city: '洛阳',
      address: '河南省洛阳市博物馆路 6 号',
      openTime: '09:00 - 18:00',
      longitude: '112.454',
      latitude: '34.618',
      intro: '聚焦中原地区的陶俑、香炉与礼器，用于展示地域文明的延续关系。',
      artifactIds: [2, 5],
    },
    'museums',
    'central-plains-museum.svg',
  ),
  withImage(
    {
      id: 3,
      name: '江南青瓷馆',
      city: '龙泉',
      address: '浙江省龙泉市青瓷大道 88 号',
      openTime: '08:30 - 17:00',
      longitude: '119.135',
      latitude: '28.074',
      intro: '以宋元青瓷与玉器为主题，强调温润、节制的江南器物美学。',
      artifactIds: [3, 6],
    },
    'museums',
    'jiangnan-celadon-museum.svg',
  ),
  withImage(
    {
      id: 4,
      name: '海上艺术陈列馆',
      city: '上海',
      address: '上海市黄浦区海港路 102 号',
      openTime: '09:30 - 17:00',
      longitude: '121.473',
      latitude: '31.230',
      intro: '围绕明清瓷器与海上交流主题布展，适合承接馆藏叙事和城市导览能力。',
      artifactIds: [7, 8],
    },
    'museums',
    'maritime-art-gallery.svg',
  ),
]

export const currentUser = {
  name: '林若',
  phone: '13800001111',
  email: 'linruo@example.com',
  city: '北京',
  bio: '主要关注文物详情、馆藏路线与收藏回看。',
  favoriteCount: 3,
}

export const favoriteArtifactIds = [1, 3, 6]

function formatDateTime(date = new Date()) {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')

  return `${year}-${month}-${day} ${hours}:${minutes}`
}

const initialArtifactComments = [
  {
    id: 1,
    artifactId: 1,
    artifactName: '青铜云纹鼎',
    username: '周岚',
    createdAt: '2026-08-18 14:20',
    content: '器型很稳，纹饰层次也很清楚，放大看细节会更有青铜礼器的厚重感。',
    likeCount: 36,
    likedBy: ['林若', '顾屿', '周岚'],
    status: 'approved',
    reviewedBy: 'admin',
    reviewedAt: '2026-08-18 15:06',
  },
  {
    id: 2,
    artifactId: 1,
    artifactName: '青铜云纹鼎',
    username: '沈砚',
    createdAt: '2026-08-23 09:45',
    content: '如果详情里能再补一段用途背景，会更容易理解它在礼制中的位置。',
    likeCount: 4,
    likedBy: [],
    status: 'pending',
    reviewedBy: '',
    reviewedAt: '',
  },
  {
    id: 3,
    artifactId: 3,
    artifactName: '龙泉青瓷梅瓶',
    username: '林若',
    createdAt: '2026-08-20 11:08',
    content: '釉色非常温润，页面上的图片已经很好看了，线下实物应该会更惊艳。',
    likeCount: 48,
    likedBy: ['周岚', '顾屿'],
    status: 'approved',
    reviewedBy: 'curator01',
    reviewedAt: '2026-08-20 11:40',
  },
  {
    id: 4,
    artifactId: 7,
    artifactName: '元青花大盘',
    username: '顾屿',
    createdAt: '2026-08-22 16:12',
    content: '构图很满，但看起来一点都不乱，青花发色也特别稳。',
    likeCount: 22,
    likedBy: ['林若'],
    status: 'approved',
    reviewedBy: 'admin',
    reviewedAt: '2026-08-22 16:35',
  },
  {
    id: 5,
    artifactId: 4,
    artifactName: '仕女图卷',
    username: '许棠',
    createdAt: '2026-08-24 08:32',
    content: '评论内容太简单，建议补充更多画面观察后再发布。',
    likeCount: 1,
    likedBy: [],
    status: 'rejected',
    reviewedBy: 'admin',
    reviewedAt: '2026-08-24 09:05',
  },
]

export const artifactComments = reactive(initialArtifactComments.map((item) => ({ ...item })))

export const commentStatusText = {
  pending: '待审核',
  approved: '已通过',
  rejected: '已驳回',
}

export function getArtifactCommentsByArtifactId(artifactId, status) {
  return [...artifactComments]
    .filter((item) => {
      if (item.artifactId !== Number(artifactId)) {
        return false
      }

      if (!status) {
        return true
      }

      return item.status === status
    })
    .sort((left, right) => right.createdAt.localeCompare(left.createdAt))
}

export function addArtifactComment({ artifactId, username, content }) {
  const artifact = getArtifactById(artifactId)
  if (!artifact) {
    return null
  }

  const comment = {
    id: Date.now(),
    artifactId: artifact.id,
    artifactName: artifact.name,
    username: username?.trim() || '匿名用户',
    createdAt: formatDateTime(),
    content: content.trim(),
    likeCount: 0,
    likedBy: [],
    status: 'pending',
    reviewedBy: '',
    reviewedAt: '',
  }

  artifactComments.unshift(comment)
  return comment
}

export function reviewArtifactComment(commentId, nextStatus, reviewer = 'admin') {
  const target = artifactComments.find((item) => item.id === commentId)
  if (!target) {
    return null
  }

  target.status = nextStatus

  if (nextStatus === 'pending') {
    target.reviewedBy = ''
    target.reviewedAt = ''
    return target
  }

  target.reviewedBy = reviewer
  target.reviewedAt = formatDateTime()
  return target
}

export function toggleArtifactCommentLike(commentId, username) {
  const target = artifactComments.find((item) => item.id === commentId)
  if (!target || !username) {
    return null
  }

  if (!Array.isArray(target.likedBy)) {
    target.likedBy = []
  }

  const index = target.likedBy.indexOf(username)

  if (index >= 0) {
    target.likedBy.splice(index, 1)
    target.likeCount = Math.max(0, target.likeCount - 1)
    return target
  }

  target.likedBy.push(username)
  target.likeCount += 1
  return target
}

export const adminUsers = [
  {
    id: 1,
    username: 'admin',
    role: '管理员',
    password: 'admin123',
    status: '启用',
    lastLogin: '2026-08-23 21:13',
    updatedAt: '2026-08-24 09:12',
  },
  {
    id: 2,
    username: 'curator01',
    role: '管理员',
    password: 'curator123',
    status: '启用',
    lastLogin: '2026-08-22 16:40',
    updatedAt: '2026-08-23 16:40',
  },
  {
    id: 3,
    username: 'guest88',
    role: '用户',
    password: 'guest123',
    status: '禁用',
    lastLogin: '2026-08-20 09:02',
    updatedAt: '2026-08-20 09:02',
  },
]

export const siteStats = [
  { label: '文物藏品', value: '8' },
  { label: '博物馆', value: '4' },
  { label: '收藏关系', value: '3' },
  { label: '主题路线', value: '12+' },
]

export const adminMetrics = [
  { label: '文物总数', value: '8' },
  { label: '博物馆总数', value: '4' },
  { label: '用户数量', value: '3' },
  { label: '收藏数量', value: '3' },
]

export function getArtifactById(id) {
  return artifacts.find((item) => item.id === Number(id))
}

export function getMuseumById(id) {
  return museums.find((item) => item.id === Number(id))
}

export function getArtifactsByMuseumId(id) {
  return artifacts.filter((item) => item.museumId === Number(id))
}

export const favoriteArtifacts = artifacts.filter((item) =>
  favoriteArtifactIds.includes(item.id),
)

export const userDashboard = {
  metrics: [
    { label: '本周浏览', value: '128', delta: '+18%' },
    { label: '我的收藏', value: '3', delta: '+2' },
    { label: '常看博物馆', value: '4', delta: '2 城市' },
    { label: '偏好匹配', value: '86', delta: '+6' },
  ],
  browseTrend: {
    labels: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
    views: [18, 22, 19, 31, 28, 35, 30],
    favorites: [1, 2, 2, 3, 3, 4, 4],
  },
  dynastyPreference: [
    { name: '唐', value: 34 },
    { name: '宋', value: 28 },
    { name: '汉', value: 18 },
    { name: '西周', value: 12 },
    { name: '清', value: 8 },
  ],
  museumVisits: [
    { name: '国家历史博物馆', value: 42 },
    { name: '中原博物馆', value: 31 },
    { name: '江南青瓷馆', value: 28 },
    { name: '海上艺术陈列馆', value: 27 },
  ],
  activityFeed: [
    { time: '09:20', title: '浏览青铜云纹鼎', detail: '停留 3 分钟' },
    { time: '11:45', title: '收藏龙泉青瓷梅瓶', detail: '加入收藏夹' },
    { time: '15:10', title: '查看江南青瓷馆', detail: '打开导览页' },
    { time: '20:05', title: '浏览元青花大盘', detail: '进入详情页' },
  ],
  recommendedArtifactIds: [3, 1, 7, 4],
}

export const adminDashboard = {
  metrics: [
    { label: '文物总数', value: '8', delta: '+2' },
    { label: '博物馆数量', value: '4', delta: '稳定' },
    { label: '待补图片', value: '12', delta: 'URL 待入库' },
    { label: '活跃用户', value: '126', delta: '+14%' },
  ],
  artifactByDynasty: [
    { name: '西周', value: 1 },
    { name: '汉', value: 1 },
    { name: '唐', value: 2 },
    { name: '宋', value: 1 },
    { name: '元', value: 1 },
    { name: '明', value: 1 },
    { name: '清', value: 1 },
  ],
  museumByCity: [
    { name: '北京', value: 1 },
    { name: '洛阳', value: 1 },
    { name: '龙泉', value: 1 },
    { name: '上海', value: 1 },
  ],
  monthlyGrowth: {
    labels: ['3月', '4月', '5月', '6月', '7月', '8月'],
    artifacts: [1, 2, 3, 5, 6, 8],
    museums: [1, 1, 2, 2, 3, 4],
  },
  userStatus: [
    { name: '启用', value: 2 },
    { name: '禁用', value: 1 },
  ],
  recentOperations: [
    { time: '09:12', actor: 'admin', action: '新增', target: '龙泉青瓷梅瓶', result: '已发布' },
    { time: '10:03', actor: 'curator01', action: '更新', target: '国家历史博物馆', result: '已保存' },
    { time: '13:46', actor: 'admin', action: '禁用', target: 'guest88', result: '已生效' },
    { time: '16:20', actor: 'admin', action: '修改', target: '中原博物馆坐标', result: '已同步' },
  ],
}
