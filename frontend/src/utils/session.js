const SESSION_KEY = 'relic-voyage-session'

export function getSession() {
  if (typeof window === 'undefined') {
    return null
  }

  const raw = window.sessionStorage.getItem(SESSION_KEY)
  if (!raw) {
    return null
  }

  try {
    const parsed = JSON.parse(raw)
    if (!parsed || typeof parsed !== 'object') {
      return null
    }
    return parsed
  } catch {
    return null
  }
}

export function setUserSession(username) {
  window.sessionStorage.setItem(
    SESSION_KEY,
    JSON.stringify({
      role: 'user',
      username,
    }),
  )
}

export function setAdminSession(username) {
  window.sessionStorage.setItem(
    SESSION_KEY,
    JSON.stringify({
      role: 'admin',
      username,
    }),
  )
}

export function clearSession() {
  window.sessionStorage.removeItem(SESSION_KEY)
}
