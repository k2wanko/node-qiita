Resource = require "./resource"

class Qiita extends Resource
  GET    = "get"
  POST   = "post"
  PUT    = "put"
  DELETE = "delete"

  RESOURCES =
    auth:
      path: "/auth"
      methods: [POST]
    items:
      path: "/items/:item_id"
      methods: [GET, POST, PUT, DELETE]
      resources:
        stock:
          path: "/stock"
          methods: [PUT, DELETE]
    rateLimit: "/rate_limit"
    search: "/search"
    stocks: "/stocks"
    tags:
      path: "/tags/:url_name"
      resources:
        items: path: "/items"
    user: "/user"
    users:
      path: "/users/:url_name"
      resources:
        items: "/items"
        stocks: "/stocks"
        following_users: "/following_users"
        following_tags: "/following_tags"

  constructor: (config = {}) ->
    host = if config.team? then "#{config.team}.qiita.com" else "qiita.com"
    super
      token: config.token
      path: "https://#{host}/api/v2"
      resources: RESOURCES

module.exports = Qiita
