### 微信自动回复

在最简单的 rails 工程的基础上，添加了处理微信公众号自动回复的逻辑：



Gemfile:

```ruby
# 读取 application.yml 配置
gem "figaro", "~> 1.1.1"

# 微信回复处理
gem 'weixin_rails_middleware', '~> 1.3.2'
```

https://github.com/lanrion/weixin_rails_middleware



config/application.yml

```yaml
development:
  # 微信自动回复相关配置
  WECHAT_REPLY_APPID: ....
  WECHAT_REPLY_APPSECRET: ....
  WECHAT_TOKEN: ....
  WECHAT_ASE_KEY: ....
```



config/routes.rb

```ruby
Rails.application.routes.draw do
  # 微信回复处理
  mount WeixinRailsMiddleware::Engine, at: "/"
end
```



added config/initializers/weixin_rails_middleware.rb



使用沙箱环境调试：  
http://mp.weixin.qq.com/debug/cgi-bin/sandbox?t=sandbox/login



回复逻辑都写在：  
app/decorators/weixin_rails_middle_ware/weixin_controller_decorator.rb



#### 运行方法

```shell
bundle install
npm install
rails s -b 0
```

