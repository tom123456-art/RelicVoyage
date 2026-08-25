function assertOk(response) {
  if (!response.ok) {
    throw new Error(`Request failed: ${response.status}`)
  }
  return response
}

async function unwrapResult(response) {
  assertOk(response)
  const result = await response.json()

  if (!result || result.code !== 200) {
    throw new Error(result?.message || 'Request failed')
  }

  return result.data
}

function buildQuery(params) {
  const searchParams = new URLSearchParams()

  Object.entries(params).forEach(([key, value]) => {
    if (value === undefined || value === null) {
      return
    }

    const text = String(value).trim()
    if (!text || text === '全部') {
      return
    }

    searchParams.set(key, text)
  })

  const query = searchParams.toString()
  return query ? `?${query}` : ''
}

export async function fetchArtifacts(filters = {}) {
  const response = await fetch(`/api/artifacts/search${buildQuery(filters)}`)
  return unwrapResult(response)
}

export async function fetchArtifactById(id) {
  const response = await fetch(`/api/artifacts/${id}`)
  return unwrapResult(response)
}

export function resolveArtifactImage(url) {
  return url ? encodeURI(url) : ''
}
