<script setup>
import { computed, reactive, ref } from 'vue'
import { ElButton, ElDialog, ElForm, ElFormItem, ElInput, ElOption, ElSelect, ElTag } from 'element-plus'
import { adminUsers } from '@/data/mock'

const permissionOptions = ['管理员', '用户']

const users = ref(adminUsers.map((item) => ({ ...item })))
const dialogVisible = ref(false)
const editingId = ref(null)
const form = reactive({
  username: '',
  role: '用户',
  password: '',
})

const isEditing = computed(() => editingId.value !== null)
const dialogTitle = computed(() => (isEditing.value ? '修改用户' : '新增用户'))
const submitLabel = computed(() => (isEditing.value ? '保存修改' : '确认新增'))
const canSubmit = computed(() => {
  if (!form.username.trim() || !form.role) return false
  return isEditing.value ? true : Boolean(form.password.trim())
})

function resetForm() {
  editingId.value = null
  form.username = ''
  form.role = '用户'
  form.password = ''
}

function openCreateDialog() {
  resetForm()
  dialogVisible.value = true
}

function openEditDialog(user) {
  editingId.value = user.id
  form.username = user.username
  form.role = user.role
  form.password = ''
  dialogVisible.value = true
}

function closeDialog() {
  dialogVisible.value = false
  resetForm()
}

function maskPassword(value) {
  return value ? '••••••••' : '未设置'
}

function handleSubmit() {
  if (!canSubmit.value) return

  const payload = {
    username: form.username.trim(),
    role: form.role,
    updatedAt: '2026-08-24 12:30',
  }

  if (isEditing.value) {
    const target = users.value.find((item) => item.id === editingId.value)
    if (!target) return

    target.username = payload.username
    target.role = payload.role
    target.updatedAt = payload.updatedAt

    if (form.password.trim()) {
      target.password = form.password.trim()
    }

    closeDialog()
    return
  }

  users.value.unshift({
    id: Date.now(),
    username: payload.username,
    role: payload.role,
    password: form.password.trim(),
    status: '启用',
    lastLogin: '未登录',
    updatedAt: payload.updatedAt,
  })
  closeDialog()
}

function toggleStatus(user) {
  user.status = user.status === '启用' ? '禁用' : '启用'
  user.updatedAt = '2026-08-24 12:30'
}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <strong>用户管理</strong>
      <el-button type="primary" round @click="openCreateDialog">新增用户</el-button>
    </div>

    <section class="table-panel role-panel">
      <div class="table-wrap">
        <table class="table">
          <thead>
            <tr>
              <th>账号名</th>
              <th>权限</th>
              <th>密码</th>
              <th>状态</th>
              <th>最近登录</th>
              <th>最近修改</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.id">
              <td>
                <div class="table-cell-strong">{{ user.username }}</div>
              </td>
              <td>
                <el-tag :type="user.role === '管理员' ? 'warning' : 'primary'" effect="light">
                  {{ user.role }}
                </el-tag>
              </td>
              <td><span class="table-note">{{ maskPassword(user.password) }}</span></td>
              <td>
                <el-tag :type="user.status === '启用' ? 'success' : 'danger'" effect="light">
                  {{ user.status }}
                </el-tag>
              </td>
              <td>{{ user.lastLogin }}</td>
              <td>{{ user.updatedAt }}</td>
              <td>
                <div class="inline-actions role-table-actions">
                  <el-button type="primary" link @click="openEditDialog(user)">修改</el-button>
                  <el-button
                    :type="user.status === '启用' ? 'danger' : 'success'"
                    link
                    @click="toggleStatus(user)"
                  >
                    {{ user.status === '启用' ? '禁用' : '启用' }}
                  </el-button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>

    <el-dialog
      v-model="dialogVisible"
      :title="dialogTitle"
      width="560px"
      destroy-on-close
      :close-on-click-modal="false"
      @closed="resetForm"
    >
      <el-form label-position="top" class="role-dialog-form">
        <el-form-item label="账号名" required>
          <el-input v-model="form.username" maxlength="20" placeholder="请输入账号名" />
        </el-form-item>

        <el-form-item label="权限" required>
          <el-select v-model="form.role" placeholder="请选择权限">
            <el-option v-for="item in permissionOptions" :key="item" :label="item" :value="item" />
          </el-select>
        </el-form-item>

        <el-form-item :label="isEditing ? '密码（留空则不修改）' : '密码'" required>
          <el-input
            v-model="form.password"
            type="password"
            show-password
            maxlength="30"
            :placeholder="isEditing ? '不修改密码可留空' : '请输入密码'"
          />
        </el-form-item>
      </el-form>

      <template #footer>
        <div class="dialog-footer">
          <el-button @click="closeDialog">取消</el-button>
          <el-button type="primary" :disabled="!canSubmit" @click="handleSubmit">
            {{ submitLabel }}
          </el-button>
        </div>
      </template>
    </el-dialog>
  </section>
</template>
