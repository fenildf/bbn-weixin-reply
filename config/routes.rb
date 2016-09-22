Rails.application.routes.draw do
  # 微信回复处理
  mount WeixinRailsMiddleware::Engine, at: "/"

  get  '/config',           to: 'config#index'
  post '/config/save_menu', to: 'config#save_menu'
end
