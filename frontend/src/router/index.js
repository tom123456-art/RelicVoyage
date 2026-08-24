import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '@/pages/HomeView.vue'
import AdminHomeView from '@/pages/AdminHomeView.vue'
import ArtifactListView from '@/pages/ArtifactListView.vue'
import ArtifactDetailView from '@/pages/ArtifactDetailView.vue'
import MuseumListView from '@/pages/MuseumListView.vue'
import MuseumDetailView from '@/pages/MuseumDetailView.vue'
import LoginView from '@/pages/LoginView.vue'
import RegisterView from '@/pages/RegisterView.vue'
import ProfileView from '@/pages/ProfileView.vue'
import FavoritesView from '@/pages/FavoritesView.vue'
import AdminArtifactsView from '@/pages/AdminArtifactsView.vue'
import AdminMuseumsView from '@/pages/AdminMuseumsView.vue'
import AdminCommentsView from '@/pages/AdminCommentsView.vue'
import AdminUsersView from '@/pages/AdminUsersView.vue'
import { getSession } from '@/utils/session'

const routes = [
  { path: '/', name: 'home', component: HomeView },
  { path: '/admin', name: 'admin-home', component: AdminHomeView, alias: '/admin/home' },
  { path: '/login', name: 'login', component: LoginView },
  { path: '/register', name: 'register', component: RegisterView },
  { path: '/admin/login', redirect: '/login?role=admin' },
  { path: '/artifacts', name: 'artifacts', component: ArtifactListView },
  { path: '/artifacts/:id', name: 'artifact-detail', component: ArtifactDetailView },
  { path: '/museums', name: 'museums', component: MuseumListView },
  { path: '/museums/:id', name: 'museum-detail', component: MuseumDetailView },
  { path: '/profile', name: 'profile', component: ProfileView },
  { path: '/profile/favorites', name: 'favorites', component: FavoritesView },
  { path: '/admin/artifacts', name: 'admin-artifacts', component: AdminArtifactsView },
  { path: '/admin/museums', name: 'admin-museums', component: AdminMuseumsView },
  { path: '/admin/comments', name: 'admin-comments', component: AdminCommentsView },
  { path: '/admin/users', name: 'admin-users', component: AdminUsersView },
  { path: '/:pathMatch(.*)*', redirect: '/' },
]

const router = createRouter({
  history: createWebHashHistory(),
  routes,
  scrollBehavior() {
    return { top: 0 }
  },
})

router.beforeEach((to) => {
  const session = getSession()
  const isAuthRoute = ['/login', '/register'].includes(to.path)
  const isAdminRoute = to.path.startsWith('/admin')
  const isUserRoute = !isAdminRoute && !isAuthRoute

  if (!session) {
    if (isAuthRoute) {
      return true
    }
    return isAdminRoute ? '/login?role=admin' : '/login'
  }

  if (isAuthRoute) {
    return session.role === 'admin' ? '/admin' : '/'
  }

  if (session.role === 'admin') {
    if (isUserRoute) {
      return '/admin'
    }
    return true
  }

  if (isAdminRoute) {
    return '/'
  }

  return true
})

export default router
