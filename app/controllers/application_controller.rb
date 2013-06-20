class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :put_nav, only: [:index, :purchase, :favor, :uploaded]
  before_filter :set_locale, :check_locale_show
		
  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    #I18n.locale = session[:locale] || I18n.default_locale
    I18n.locale = 'zh-CN'
    if session[:locale] == 'en'
      @en_status = 'locale_status'
      @cn_status = ''
    else
      @en_status = ''
      @cn_status = 'locale_status'      
    end
  end	
  
  def put_nav
    session[:product_nav] = params[:action]
  end
  
  def check_locale_show
    unless self.action_name  == "new" or self.action_name  == "edit"
      session[:allow_show] = "true" 
    else
      session[:allow_show] = "false"
    end
  end

  def check_girls_state
    girls = Girl.where(["state = ? ", "working"])
    
    girls.each do |girl|
      last_task = girl.tasks.last
      next if last_task.nil?
      girl.complete_work if last_task.endtime < Time.now
    end
  end
end
