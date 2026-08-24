export const endpoints = {
  auth: {
    login: '/api/auth/login',
    register: '/api/auth/register',
    profileUpdate: '/api/profile/update',
    adminLogin: '/api/admin/login',
  },
  artifacts: {
    search: '/api/artifacts/search',
    save: '/api/admin/artifacts/save',
    delete: '/api/admin/artifacts/delete',
    favoriteAdd: '/api/favorites/add',
    favoriteRemove: '/api/favorites/remove',
  },
  museums: {
    search: '/api/museums/search',
    save: '/api/admin/museums/save',
    delete: '/api/admin/museums/delete',
  },
  users: {
    search: '/api/admin/users/search',
    save: '/api/admin/users/save',
  },
}
