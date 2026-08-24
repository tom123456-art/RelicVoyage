<script setup>
import { computed, reactive, ref } from 'vue'
import { useRoute } from 'vue-router'
import {
  addArtifactComment,
  artifacts,
  getArtifactCommentRepliesByCommentId,
  getArtifactCommentsByArtifactId,
  getArtifactById,
  getMuseumById,
  toggleArtifactCommentLike,
} from '@/data/mock'
import { endpoints } from '@/data/endpoints'
import { getSession } from '@/utils/session'

const route = useRoute()
const noop = () => {}
const commentsOpen = ref(false)
const commentError = ref('')
const commentSuccess = ref('')
const commentForm = reactive({
  content: '',
})

const artifact = computed(() => getArtifactById(route.params.id))
const museum = computed(() =>
  artifact.value ? getMuseumById(artifact.value.museumId) : null,
)
const currentSession = computed(() => {
  route.fullPath
  return getSession()
})
const relatedArtifacts = computed(() =>
  artifact.value
    ? artifacts
        .filter(
          (item) =>
            item.museumId === artifact.value.museumId &&
            item.id !== artifact.value.id,
        )
        .slice(0, 3)
    : [],
)
const displayedComments = computed(() =>
  artifact.value
    ? getArtifactCommentsByArtifactId(artifact.value.id).sort((left, right) => {
        if (right.likeCount !== left.likeCount) {
          return right.likeCount - left.likeCount
        }

        return right.createdAt.localeCompare(left.createdAt)
      })
    : [],
)

function toggleComments() {
  commentsOpen.value = !commentsOpen.value
}

function handleCommentTyping() {
  commentError.value = ''
  commentSuccess.value = ''
}

function handleCommentSubmit() {
  const content = commentForm.content.trim()

  commentError.value = ''
  commentSuccess.value = ''

  if (!artifact.value) {
    return
  }

  if (!content) {
    commentError.value = '请输入评论内容后再提交。'
    return
  }

  if (content.length < 6) {
    commentError.value = '评论内容至少输入 6 个字。'
    return
  }

  addArtifactComment({
    artifactId: artifact.value.id,
    username: currentSession.value?.username ?? '当前用户',
    content,
  })

  commentForm.content = ''
  commentSuccess.value = '评论已发布，管理员回复后会显示在评论下方。'
  commentsOpen.value = true
}

function isCommentLiked(comment) {
  const username = currentSession.value?.username
  if (!username) {
    return false
  }

  return Array.isArray(comment.likedBy) && comment.likedBy.includes(username)
}

function handleCommentLike(commentId) {
  const username = currentSession.value?.username
  if (!username) {
    return
  }

  toggleArtifactCommentLike(commentId, username)
}
</script>

<template>
  <template v-if="artifact">
    <section class="detail-layout">
      <article class="detail-panel">
        <figure class="detail-figure media-frame">
          <img :src="artifact.imageUrl || artifact.image" :alt="artifact.name" />
        </figure>

        <div class="tag-row" style="margin-top: 1rem">
          <span class="tag">{{ artifact.dynasty }}</span>
          <span class="tag tag--teal">{{ artifact.material }}</span>
          <span class="tag">{{ artifact.type }}</span>
        </div>
      </article>

      <aside class="detail-panel">
        <p class="eyebrow">文物详情</p>
        <h1 style="margin: 0 0 0.5rem; font-family: 'Source Han Serif SC', 'Noto Serif SC', 'Songti SC', serif">
          {{ artifact.name }}
        </h1>
        <p class="lead">{{ artifact.description }}</p>

        <div class="info-list">
          <div class="info-row">
            <span>所属博物馆</span>
            <strong>{{ museum?.name }}</strong>
          </div>
          <div class="info-row">
            <span>出土地</span>
            <strong>{{ artifact.origin }}</strong>
          </div>
          <div class="info-row">
            <span>收藏数</span>
            <strong>{{ artifact.favoriteCount }}</strong>
          </div>
        </div>

        <form
          class="form"
          :action="endpoints.artifacts.favoriteAdd"
          method="post"
          @submit.prevent="noop"
          style="margin-top: 1rem"
        >
          <input type="hidden" name="artifactId" :value="artifact.id" />
          <div class="artifact-action-row">
            <div class="artifact-favorite-summary" aria-label="当前收藏人数">
              <span>当前收藏人数</span>
              <strong>{{ artifact.favoriteCount }}</strong>
              <small>人已收藏</small>
            </div>
            <button type="submit" class="button button--primary">
              收藏
              <span class="button-count">{{ artifact.favoriteCount }}</span>
            </button>
            <RouterLink to="/artifacts" class="button button--ghost">返回列表</RouterLink>
          </div>
        </form>
      </aside>
    </section>

    <section class="section">
      <div class="comment-section">
        <button
          type="button"
          class="comment-toggle"
          :class="{ 'is-open': commentsOpen }"
          @click="toggleComments"
        >
          <span class="comment-toggle__copy">
            <strong>文物评论</strong>
            <small>默认收起，点击后查看评论并发表评论</small>
          </span>
          <span class="comment-toggle__summary">{{ displayedComments.length }} 条评论</span>
          <span class="comment-toggle__icon">⌄</span>
        </button>

        <div v-show="commentsOpen" class="comment-panel">
          <form class="comment-editor" @submit.prevent="handleCommentSubmit">
            <textarea
              id="artifact-comment-textarea"
              v-model="commentForm.content"
              class="textarea comment-editor__textarea"
              placeholder="请输入你对这件文物的评论内容。"
              @input="handleCommentTyping"
            ></textarea>
            <button type="submit" class="button button--primary comment-editor__submit">
              发表评论
            </button>
          </form>

          <div class="comment-panel__meta">
            <p v-if="commentError" class="field-error">{{ commentError }}</p>
            <p v-else-if="commentSuccess" class="comment-feedback">{{ commentSuccess }}</p>
          </div>

          <div class="comment-feed">
            <div class="comment-feed__head">
              <strong>最热评论</strong>
              <span>默认按点赞数量从高到低排序，可滚动查看更多</span>
            </div>

            <div class="comment-list">
              <article v-for="item in displayedComments" :key="item.id" class="comment-card">
                <div class="comment-card__meta">
                  <strong>{{ item.username }}</strong>
                  <span>{{ item.createdAt }}</span>
                </div>
                <p>{{ item.content }}</p>
                <div
                  v-if="getArtifactCommentRepliesByCommentId(item.id).length"
                  class="comment-replies"
                >
                  <article
                    v-for="reply in getArtifactCommentRepliesByCommentId(item.id)"
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
                <div class="comment-card__footer">
                  <button
                    type="button"
                    class="comment-like-button"
                    :class="{ 'is-active': isCommentLiked(item) }"
                    @click="handleCommentLike(item.id)"
                  >
                    <span>{{ isCommentLiked(item) ? '已赞' : '点赞' }}</span>
                    <strong>{{ item.likeCount }}</strong>
                  </button>
                </div>
              </article>

              <div v-if="!displayedComments.length" class="empty comment-empty">
                当前还没有评论，欢迎留下第一条看法。
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="section-header">
        <div>
          <h2>同馆文物</h2>
          <p>与当前文物同属一个博物馆的精选条目。</p>
        </div>
      </div>

      <div class="card-grid">
        <article v-for="item in relatedArtifacts" :key="item.id" class="card">
          <img :src="item.imageUrl || item.image" :alt="item.name" class="card-media" />
          <div class="card-body">
            <div class="tag-row">
              <span class="tag">{{ item.dynasty }}</span>
              <span class="tag tag--teal">{{ item.type }}</span>
            </div>
            <h3>{{ item.name }}</h3>
            <p>{{ item.description }}</p>
            <RouterLink :to="`/artifacts/${item.id}`" class="button button--secondary">查看详情</RouterLink>
          </div>
        </article>
      </div>
    </section>
  </template>
</template>
