<script setup>
import { computed, reactive, ref } from 'vue'
import { artifacts, artifactFilters, museums } from '@/data/mock'
import { endpoints } from '@/data/endpoints'

const managedArtifacts = ref(artifacts.map((item) => ({ ...item })))
const editingId = ref(null)

const form = reactive({
  name: '',
  dynasty: artifactFilters.dynasties[1] ?? '',
  material: artifactFilters.materials[1] ?? '',
  type: artifactFilters.types[1] ?? '',
  museumId: museums[0]?.id ?? '',
  origin: '',
  imageUrl: '',
  description: '',
})

const isEditing = computed(() => editingId.value !== null)
const activeArtifacts = computed(() =>
  managedArtifacts.value.filter((item) => item.status !== 'offline'),
)

function resetForm() {
  editingId.value = null
  form.name = ''
  form.dynasty = artifactFilters.dynasties[1] ?? ''
  form.material = artifactFilters.materials[1] ?? ''
  form.type = artifactFilters.types[1] ?? ''
  form.museumId = museums[0]?.id ?? ''
  form.origin = ''
  form.imageUrl = ''
  form.description = ''
}

function startEdit(item) {
  editingId.value = item.id
  form.name = item.name ?? ''
  form.dynasty = item.dynasty ?? artifactFilters.dynasties[1] ?? ''
  form.material = item.material ?? artifactFilters.materials[1] ?? ''
  form.type = item.type ?? artifactFilters.types[1] ?? ''
  form.museumId = item.museumId ?? museums[0]?.id ?? ''
  form.origin = item.origin ?? ''
  form.imageUrl = item.imageUrl ?? item.image ?? ''
  form.description = item.description ?? ''
}

function handleSubmit() {
  const name = form.name.trim()
  if (!name) {
    return
  }

  const museumId = Number(form.museumId) || museums[0]?.id
  const museum = museums.find((item) => item.id === museumId)
  const target = managedArtifacts.value.find((item) => item.id === editingId.value)
  const imageUrl = form.imageUrl.trim() || target?.imageUrl || target?.image || ''
  const payload = {
    name,
    dynasty: form.dynasty,
    material: form.material,
    type: form.type,
    museumId,
    museumName: museum?.name ?? '',
    origin: form.origin.trim(),
    imageUrl,
    image: imageUrl,
    description: form.description.trim(),
  }

  if (target) {
    Object.assign(target, payload)
  } else {
    managedArtifacts.value.unshift({
      id: Date.now(),
      favoriteCount: 0,
      ...payload,
    })
  }

  resetForm()
}

function handleOffline(item) {
  item.status = 'offline'
  if (editingId.value === item.id) {
    resetForm()
  }
}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>文物管理</strong>
        <p>维护文物基础信息、图片和说明。</p>
      </div>
    </div>

    <div class="detail-layout">
      <article class="detail-panel artifact-editor-panel">
        <div class="management-editor-head">
          <h2>{{ isEditing ? '修改文物' : '新增文物' }}</h2>
          <p>{{ isEditing ? '右侧修改内容已回填，保存后完成修改。' : '填写内容后点击保存即可新增文物。' }}</p>
        </div>

        <form
          class="form artifact-editor-form"
          :action="endpoints.artifacts.save"
          method="post"
          enctype="multipart/form-data"
          @submit.prevent="handleSubmit"
        >
          <div class="form-grid">
            <div class="field">
              <label class="label" for="artifact-name">名称</label>
              <input id="artifact-name" v-model="form.name" class="input" name="name" placeholder="文物名称" />
            </div>
            <div class="field">
              <label class="label" for="artifact-dynasty">朝代</label>
              <select id="artifact-dynasty" v-model="form.dynasty" class="select" name="dynasty">
                <option v-for="item in artifactFilters.dynasties.slice(1)" :key="item" :value="item">
                  {{ item }}
                </option>
              </select>
            </div>
            <div class="field">
              <label class="label" for="artifact-material">材质</label>
              <select id="artifact-material" v-model="form.material" class="select" name="material">
                <option v-for="item in artifactFilters.materials.slice(1)" :key="item" :value="item">
                  {{ item }}
                </option>
              </select>
            </div>
            <div class="field">
              <label class="label" for="artifact-type">类型</label>
              <select id="artifact-type" v-model="form.type" class="select" name="type">
                <option v-for="item in artifactFilters.types.slice(1)" :key="item" :value="item">
                  {{ item }}
                </option>
              </select>
            </div>
            <div class="field">
              <label class="label" for="artifact-museum">所属博物馆</label>
              <select id="artifact-museum" v-model="form.museumId" class="select" name="museumId">
                <option v-for="item in museums" :key="item.id" :value="item.id">
                  {{ item.name }}
                </option>
              </select>
            </div>
            <div class="field">
              <label class="label" for="artifact-origin">出土地</label>
              <input id="artifact-origin" v-model="form.origin" class="input" name="origin" placeholder="出土地" />
            </div>
            <div class="field">
              <label class="label" for="artifact-imageFile">上传图片</label>
              <input id="artifact-imageFile" class="input" name="imageFile" type="file" accept="image/*" />
            </div>
            <div class="field">
              <label class="label" for="artifact-imageUrl">图片地址</label>
              <input
                id="artifact-imageUrl"
                v-model="form.imageUrl"
                class="input"
                name="imageUrl"
                placeholder="可选：图片 URL"
              />
            </div>
            <div class="field field--full">
              <label class="label" for="artifact-description">简介</label>
              <textarea
                id="artifact-description"
                v-model="form.description"
                class="textarea"
                name="description"
                placeholder="文物简介"
              ></textarea>
            </div>
          </div>

          <button type="submit" class="button button--primary">保存</button>
        </form>
      </article>

      <aside class="table-panel">
        <div class="section-header" style="margin-bottom: 1rem">
          <div>
            <h2>现有文物</h2>
            <p>当前可管理的文物条目。</p>
          </div>
        </div>

        <div class="table-wrap">
          <table class="table artifact-admin-table">
            <thead>
              <tr>
                <th>名称</th>
                <th>朝代</th>
                <th>博物馆</th>
                <th>收藏数</th>
                <th class="artifact-actions-column">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="item in activeArtifacts" :key="item.id">
                <td>{{ item.name }}</td>
                <td>{{ item.dynasty }}</td>
                <td>{{ item.museumName }}</td>
                <td>{{ item.favoriteCount }}</td>
                <td>
                  <div class="inline-actions artifact-admin-actions">
                    <button type="button" class="table-action table-action--edit" @click="startEdit(item)">
                      修改
                    </button>
                    <button type="button" class="table-action table-action--offline" @click="handleOffline(item)">
                      下架
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div v-if="!activeArtifacts.length" class="empty">当前没有在架文物。</div>
      </aside>
    </div>
  </section>
</template>
