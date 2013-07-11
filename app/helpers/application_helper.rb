# coding: utf-8
module ApplicationHelper
  def get_keywords
    keywords = ""
     
    return keywords
  end
  
  def get_description    
  end
  
  def get_head_title
    #产品-分类-网站名称
    title = "下单么-服务预订平台"
    title = @current_company.name if user_signed_in? and !@current_company.nil?
  end

end
