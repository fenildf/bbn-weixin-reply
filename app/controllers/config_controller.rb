class ConfigController < ApplicationController
  def index
    @component_name = 'SlideShow'
    @component_data = {}
  end
end