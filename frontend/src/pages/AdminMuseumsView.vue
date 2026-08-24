<script setup>
import { computed, reactive, ref } from 'vue'
import { ElTag } from 'element-plus'
import { museums } from '@/data/mock'
import { endpoints } from '@/data/endpoints'

const managedMuseums = ref(
  museums.map((item) => ({
    ...item,
    artifactIds: [...(item.artifactIds ?? [])],
  })),
)
const editingId = ref(null)

const form = reactive({
  name: '',
  city: '',
  address: '',
  openTime: '',
  longitude: '',
  latitude: '',
  imageUrl: '',
  intro: '',
})

const isEditing = computed(() => editingId.value !== null)
const activeMuseums = computed(() =>
  managedMuseums.value.filter((item) => item.status !== 'disabled'),
)

const museumStats = computed(() => {
  const totalMuseums = activeMuseums.value.length
  const cityCount = new Set(activeMuseums.value.map((item) => item.city)).size
  const totalArtifacts = activeMuseums.value.reduce(
    (sum, item) => sum + (item.artifactIds?.length ?? 0),
    0,
  )
  const averageArtifacts = totalMuseums ? Math.round(totalArtifacts / totalMuseums) : 0

  return [
    { label: '博物馆数量', value: `${totalMuseums}` },
    { label: '覆盖城市', value: `${cityCount}` },
    { label: '馆藏总数', value: `${totalArtifacts}` },
    { label: '平均馆藏', value: `${averageArtifacts}` },
  ]
})

function resetForm() {
  editingId.value = null
  form.name = ''
  form.city = ''
  form.address = ''
  form.openTime = ''
  form.longitude = ''
  form.latitude = ''
  form.imageUrl = ''
  form.intro = ''
}

function startEdit(item) {
  editingId.value = item.id
  form.name = item.name ?? ''
  form.city = item.city ?? ''
  form.address = item.address ?? ''
  form.openTime = item.openTime ?? ''
  form.longitude = item.longitude ?? ''
  form.latitude = item.latitude ?? ''
  form.imageUrl = item.imageUrl ?? item.image ?? ''
  form.intro = item.intro ?? ''
}

function handleSubmit() {
  const name = form.name.trim()
  if (!name) {
    return
  }

  const target = managedMuseums.value.find((item) => item.id === editingId.value)
  const imageUrl = form.imageUrl.trim() || target?.imageUrl || target?.image || ''
  const payload = {
    name,
    city: form.city.trim(),
    address: form.address.trim(),
    openTime: form.openTime.trim(),
    longitude: form.longitude.trim(),
    latitude: form.latitude.trim(),
    imageUrl,
    image: imageUrl,
    intro: form.intro.trim(),
  }

  if (target) {
    Object.assign(target, payload)
  } else {
    managedMuseums.value.unshift({
      id: Date.now(),
      artifactIds: [],
      ...payload,
    })
  }

  resetForm()
}

function handleDisable(item) {
  item.status = 'disabled'
  if (editingId.value === item.id) {
    resetForm()
  }
}
</script>

<template>
  <section class="section-panel museum-admin-shell">
    <div class="museum-admin-hero">
      <div class="museum-admin-hero__copy">
        <p class="eyebrow">博物馆管理</p>
        <h1>维护场馆信息、开放时间和位置数据</h1>
        <p class="lead">左侧编辑，右侧管理现有场馆。</p>
      </div>

      <div class="museum-admin-hero__stats">
        <div v-for="item in museumStats" :key="item.label" class="museum-stat-card">
          <span>{{ item.label }}</span>
          <strong>{{ item.value }}</strong>
        </div>
      </div>
    </div>

    <div class="museum-admin-layout">
      <aside class="detail-panel museum-editor-panel">
        <div class="museum-editor-head">
          <h2>{{ isEditing ? '修改博物馆' : '新增博物馆' }}</h2>
          <p>{{ isEditing ? '右侧修改内容已回填，保存后完成修改。' : '填写内容后点击保存即可新增博物馆。' }}</p>
        </div>

        <form
          class="form museum-editor-form"
          :action="endpoints.museums.save"
          method="post"
          @submit.prevent="handleSubmit"
        >
          <div class="form-grid">
            <div class="field">
              <label class="label" for="museum-name">名称</label>
              <input id="museum-name" v-model="form.name" class="input" name="name" placeholder="博物馆名称" />
            </div>
            <div class="field">
              <label class="label" for="museum-city">城市</label>
              <input id="museum-city" v-model="form.city" class="input" name="city" placeholder="城市" />
            </div>
            <div class="field">
              <label class="label" for="museum-address">地址</label>
              <input id="museum-address" v-model="form.address" class="input" name="address" placeholder="详细地址" />
            </div>
            <div class="field">
              <label class="label" for="museum-openTime">开放时间</label>
              <input
                id="museum-openTime"
                v-model="form.openTime"
                class="input"
                name="openTime"
                placeholder="09:00 - 17:00"
              />
            </div>
            <div class="field">
              <label class="label" for="museum-longitude">经度</label>
              <input
                id="museum-longitude"
                v-model="form.longitude"
                class="input"
                name="longitude"
                placeholder="116.404"
              />
            </div>
            <div class="field">
              <label class="label" for="museum-latitude">纬度</label>
              <input id="museum-latitude" v-model="form.latitude" class="input" name="latitude" placeholder="39.915" />
            </div>
            <div class="field field--full">
              <label class="label" for="museum-imageUrl">图片地址</label>
              <input
                id="museum-imageUrl"
                v-model="form.imageUrl"
                class="input"
                name="imageUrl"
                placeholder="博物馆图片 URL"
              />
            </div>
            <div class="field field--full">
              <label class="label" for="museum-intro">简介</label>
              <textarea
                id="museum-intro"
                v-model="form.intro"
                class="textarea"
                name="intro"
                placeholder="博物馆简介"
              ></textarea>
            </div>
          </div>

          <button type="submit" class="button button--primary">保存</button>
        </form>
      </aside>

      <section class="dashboard-card museum-overview-panel">
        <div class="museum-overview-head">
          <div>
            <h2>现有博物馆</h2>
            <p>按卡片浏览场馆信息。</p>
          </div>
        </div>

        <div class="museum-card-grid">
          <article v-for="item in activeMuseums" :key="item.id" class="museum-item-card">
            <div class="museum-item-card__head">
              <div>
                <strong>{{ item.name }}</strong>
                <span>{{ item.city }}</span>
              </div>
              <ElTag size="small" effect="plain" type="success">
                {{ item.artifactIds?.length ?? 0 }} 件
              </ElTag>
            </div>

            <div class="museum-item-card__meta">
              <span>{{ item.openTime }}</span>
              <span>{{ item.address }}</span>
            </div>

            <p>{{ item.intro }}</p>

            <div class="museum-item-card__actions">
              <button type="button" class="table-action table-action--edit" @click="startEdit(item)">
                修改
              </button>
              <button type="button" class="table-action table-action--offline" @click="handleDisable(item)">
                停用
              </button>
            </div>
          </article>
        </div>

        <div v-if="!activeMuseums.length" class="empty">当前没有启用中的博物馆。</div>
      </section>
    </div>
  </section>
</template>
