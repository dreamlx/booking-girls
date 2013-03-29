class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :put_nav, only: [:index, :purchase, :favor, :uploaded]
  before_filter :set_locale
		
  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end	
  
  def put_nav
    session[:product_nav] = params[:action]
  end
  
end
