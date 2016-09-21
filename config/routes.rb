Rails.application.routes.draw do
  # 微信回复处理
  mount WeixinRailsMiddleware::Engine, at: "/"
end
