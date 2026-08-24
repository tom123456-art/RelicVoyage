<script setup>
import { computed, ref } from 'vue'
import {
  artifactComments,
  addArtifactCommentReply,
  getArtifactCommentRepliesByCommentId,
} from '@/data/mock'
import { endpoints } from '@/data/endpoints'
import { getSession } from '@/utils/session'

const activeReplyId = ref(null)
const replyDraft = ref('')
const replyError = ref('')
const replySuccess = ref('')

const currentAdmin = computed(() => getSession()?.username ?? 'admin')
const commentList = computed(() =>
  [...artifactComments].sort((left, right) => right.createdAt.localeCompare(left.createdAt)),
)
const totalReplies = computed(() =>
  commentList.value.reduce(
    (total, comment) => total + getArtifactCommentRepliesByCommentId(comment.id).length,
    0,
  ),
)
const repliedComments = computed(
  () =>
    commentList.value.filter(
      (comment) => getArtifactCommentRepliesByCommentId(comment.id).length,
    ).length,
)
const pendingReplyCount = computed(() => commentList.value.length - repliedComments.value)

function replyCount(comment) {
  return getArtifactCommentRepliesByCommentId(comment.id).length
}

function openReply(comment) {
  replyError.value = ''
  replySuccess.value = ''

  if (activeReplyId.value === comment.id) {
    activeReplyId.value = null
    replyDraft.value = ''
    return
  }

  activeReplyId.value = comment.id
  replyDraft.value = ''
}

function cancelReply() {
  activeReplyId.value = null
  replyDraft.value = ''
  replyError.value = ''
}

function handleReplyTyping() {
  replyError.value = ''
  replySuccess.value = ''
}

function handleReplySubmit(comment) {
  const content = replyDraft.value.trim()
  replyError.value = ''
  replySuccess.value = ''

  if (!content) {
    replyError.value = '请输入回复内容。'
    return
  }

  if (content.length < 2) {
    replyError.value = '回复内容至少输入 2 个字。'
    return
  }

  addArtifactCommentReply({
    commentId: comment.id,
    username: currentAdmin.value,
    content,
  })

  replyDraft.value = ''
  activeReplyId.value = null
  replySuccess.value = `已回复「${comment.username}」的评论。`
}
</script>

<template>
  <section class="section-panel comment-reply-page">
    <div class="toolbar">
      <div>
        <strong>评论回复</strong>
        <p>围绕具体评论进行回应，回复会直接显示在对应评论下方。</p>
      </div>
    </div>

    <div class="comment-review-metrics">
      <article class="comment-review-metric">
        <span>全部评论</span>
        <strong>{{ commentList.length }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>已回复评论</span>
        <strong>{{ repliedComments }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>待回复评论</span>
        <strong>{{ pendingReplyCount }}</strong>
      </article>
      <article class="comment-review-metric">
        <span>回复总数</span>
        <strong>{{ totalReplies }}</strong>
      </article>
    </div>

    <section class="table-panel comment-reply-panel">
      <div class="comment-reply-panel__head">
        <div>
          <strong>评论列表</strong>
          <p>选择一条评论，回复编辑器会展开在该评论的下方。</p>
        </div>
        <p v-if="replySuccess" class="comment-feedback">{{ replySuccess }}</p>
      </div>

      <div v-if="commentList.length" class="comment-reply-list">
        <article v-for="comment in commentList" :key="comment.id" class="comment-thread-card">
          <div class="comment-thread-card__head">
            <div>
              <span class="comment-thread-card__artifact">{{ comment.artifactName }}</span>
              <div class="comment-thread-card__meta">
                <strong>{{ comment.username }}</strong>
                <span>{{ comment.createdAt }}</span>
              </div>
            </div>
            <span
              class="status"
              :class="replyCount(comment) ? 'status--ok' : 'status--warn'"
            >
              {{ replyCount(comment) ? '已回复' : '待回复' }}
            </span>
          </div>

          <p class="comment-thread-card__content">{{ comment.content }}</p>

          <div v-if="replyCount(comment)" class="comment-replies">
            <article
              v-for="reply in getArtifactCommentRepliesByCommentId(comment.id)"
              :key="reply.id"
              class="comment-reply"
            >
              <div class="comment-reply__meta">
                <span class="comment-reply__label">回复</span>
                <strong>{{ reply.username }}</strong>
                <span>{{ reply.createdAt }}</span>
              </div>
              <p>{{ reply.content }}</p>
            </article>
          </div>

          <div class="comment-thread-card__footer">
            <span class="comment-thread-card__count">
              {{ replyCount(comment) }} 条回复
            </span>
            <button
              type="button"
              class="review-action review-action--reply"
              @click="openReply(comment)"
            >
              {{ activeReplyId === comment.id ? '收起回复' : '回复' }}
            </button>
          </div>

          <form
            v-if="activeReplyId === comment.id"
            class="comment-reply-editor"
            :action="endpoints.comments.reply"
            method="post"
            @submit.prevent="handleReplySubmit(comment)"
          >
            <input type="hidden" name="commentId" :value="comment.id" />
            <textarea
              v-model="replyDraft"
              class="textarea comment-reply-editor__textarea"
              name="content"
              placeholder="写下针对这条评论的回复。"
              @input="handleReplyTyping"
            ></textarea>
            <div class="comment-reply-editor__footer">
              <p v-if="replyError" class="field-error">{{ replyError }}</p>
              <div class="button-row">
                <button type="button" class="button button--ghost" @click="cancelReply">
                  取消
                </button>
                <button type="submit" class="button button--primary">发布回复</button>
              </div>
            </div>
          </form>
        </article>
      </div>

      <div v-else class="empty">当前还没有评论记录。</div>
    </section>
  </section>
</template>
