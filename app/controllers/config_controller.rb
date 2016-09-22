class ConfigController < ApplicationController
  def index
    @component_name = 'WeixinConfig'
    @component_data = {
      menu: menu_data
    }
  end

  def save_menu
    # 参考 https://github.com/lanrion/weixin_authorize/wiki/Getting-Started

    menu = YAML.load menu_data
    re = weixin_client.create_menu(menu)

    render json: {result: re}
  end

  private
    def menu_data
      # File.read File.join(Rails.root, 'weixin-config', 'menu.json')
      File.read File.join(Rails.root, 'weixin-config', 'menu.yaml')
    end

    def weixin_client
      $client ||= WeixinAuthorize::Client.new(ENV["WECHAT_REPLY_APPID"], ENV["WECHAT_REPLY_APPSECRET"])
    end
end