import request from '@/utils/request'

// 查询校园墙内容列表
export function listContent(query) {
  return request({
    url: '/admin/content/list',
    method: 'get',
    params: query
  })
}

// 查询校园墙内容详细
export function getContent(contentId) {
  return request({
    url: '/admin/content/' + contentId,
    method: 'get'
  })
}

// 新增校园墙内容
export function addContent(data) {
  return request({
    url: '/admin/content',
    method: 'post',
    data: data
  })
}

// 修改校园墙内容
export function updateContent(data) {
  return request({
    url: '/admin/content',
    method: 'put',
    data: data
  })
}

// 删除校园墙内容
export function delContent(contentId) {
  return request({
    url: '/admin/content/' + contentId,
    method: 'delete'
  })
}
