<script setup>
import { computed, ref } from 'vue'
import { artifactComments, commentStatusText, reviewArtifactComment } from '@/data/mock'
import { getSession } from '@/utils/session'

const activeFilter = ref('pending')

const filterOptions = [
  { key: 'pending', label: '待审核' },
  { key: 'approved', label: '已通过' },
  { key: 'rejected', label: '已驳回' },
  { key: 'all', label: '全部评论' },
]

const currentReviewer = computed(() => getSession()?.username ?? 'admin')
const statusCounts = computed(() =>
  artifactComments.reduce(
    (bucket, item) => {
      bucket.all += 1
      bucket[item.status] += 1
      return bucket
    },
    {
      all: 0,
      pending: 0,
      approved: 0,
      rejected: 0,
    },
  ),
)
const reviewList = computed(() => {
  const order = {
    pending: 0,
    rejected: 1,
    approved: 2,
  }

  return [...artifactComments]
    .filter((item) => activeFilter.value === 'all' || item.status === activeFilter.value)
    .sort((left, right) => {
      const orderGap = order[left.status] - order[right.status]
      if (orderGap !== 0) {
        return orderGap
      }
      return right.createdAt.localeCompare(left.createdAt)
    })
})

function getStatusClass(status) {
  if (status === 'approved') {
    return 'status--ok'
  }

  if (status === 'rejected') {
    return 'status--danger'
  }

  return 'status--warn'
}

function handleReview(commentId, nextStatus) {
  reviewArtifactComment(commentId, nextStatus, currentReviewer.value)
}
</script>

<template>
  <section class="section-panel">
    <div class="toolbar">
      <div>
        <strong>评论审核</strong>
        <p>集中审核文物评论，控制哪些内容可以在详情页公开展示。</p>
      </div>
    </div>

    <div class="comment-review-metrics">
      <article class="comment-review-metric">
        <span>待审核</span>
        <strong>{{ statusCounts.pending }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>已通过</span>
        <strong>{{ statusCounts.approved }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>已驳回</span>
        <strong>{{ statusCounts.rejected }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>全部评论</span>
        <strong>{{ statusCounts.all }}</strong>
      </article>
    </div>

    <section class="table-panel comment-review-panel">
      <div class="comment-filter-bar">
        <button
          v-for="item in filterOptions"
          :key="item.key"
          type="button"
          class="comment-filter-chip"
          :class="{ 'is-active': activeFilter === item.key }"
          @click="activeFilter = item.key"
        >
          {{ item.label }}
          <span>{{ statusCounts[item.key] }}</span>
        </button>
      </div>

      <div class="table-wrap">
        <table class="table">
          <thead>
            <tr>
              <th>文物</th>
              <th>评论人</th>
              <th>提交时间</th>
              <th>评论内容</th>
              <th>状态</th>
              <th>审核信息</th>
              <th>操作</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="comment in reviewList" :key="comment.id">
              <td>
                <div class="table-cell-strong">{{ comment.artifactName }}</div>
              </td>
              <td>{{ comment.username }}</td>
              <td>{{ comment.createdAt }}</td>
              <td>
                <div class="comment-review-content">{{ comment.content }}</div>
              </td>
              <td>
                <span class="status" :class="getStatusClass(comment.status)">
                  {{ commentStatusText[comment.status] }}
                </span>
              </td>
              <td>
                <div class="comment-review-meta">
                  <strong v-if="comment.reviewedBy">{{ comment.reviewedBy }}</strong>
                  <span>{{ comment.reviewedAt || '待审核' }}</span>
                </div>
              </td>
              <td>
                <div class="inline-actions comment-review-actions">
                  <button
                    v-if="comment.status !== 'approved'"
                    type="button"
                    class="review-action review-action--approve"
                    @click="handleReview(comment.id, 'approved')"
                  >
                    通过
                  </button>
                  <button
                    v-if="comment.status !== 'rejected'"
                    type="button"
                    class="review-action review-action--reject"
                    @click="handleReview(comment.id, 'rejected')"
                  >
                    驳回
                  </button>
                  <button
                    v-if="comment.status !== 'pending'"
                    type="button"
                    class="review-action review-action--reset"
                    @click="handleReview(comment.id, 'pending')"
                  >
                    退回待审
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div v-if="!reviewList.length" class="empty">
        当前筛选条件下没有评论记录。
      </div>
    </section>
  </section>
</template>
