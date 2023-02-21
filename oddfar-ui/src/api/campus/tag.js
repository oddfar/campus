import request from '@/utils/request'

// 查询标签列表
export function listTag(query) {
  return request({
    url: '/admin/tag/list',
    method: 'get',
    params: query
  })
}

// 查询标签详细
export function getTag(tagId) {
  return request({
    url: '/admin/tag/' + tagId,
    method: 'get'
  })
}

// 新增标签
export function addTag(data) {
  return request({
    url: '/admin/tag',
    method: 'post',
    data: data
  })
}

// 修改标签
export function updateTag(data) {
  return request({
    url: '/admin/tag',
    method: 'put',
    data: data
  })
}

// 删除标签
export function delTag(tagId) {
  return request({
    url: '/admin/tag/' + tagId,
    method: 'delete'
  })
}
