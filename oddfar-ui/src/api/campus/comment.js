import request from '@/utils/request'

// 查询评论列表
export function listComment(query) {
  return request({
    url: '/admin/comment/list',
    method: 'get',
    params: query
  })
}

// 查询评论详细
export function getComment(commentId) {
  return request({
    url: '/admin/comment/' + commentId,
    method: 'get'
  })
}

// 新增评论
export function addComment(data) {
  return request({
    url: '/admin/comment',
    method: 'post',
    data: data
  })
}

// 修改评论
export function updateComment(data) {
  return request({
    url: '/admin/comment',
    method: 'put',
    data: data
  })
}

// 删除评论
export function delComment(commentId) {
  return request({
    url: '/admin/comment/' + commentId,
    method: 'delete'
  })
}
