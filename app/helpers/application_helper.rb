# coding: utf-8
module ApplicationHelper
  def get_keywords
    keywords = "3d图纸,3d图纸库,3d打印,3d打印机,3d打印图纸,在线3d打印,在线3d设计,3d设计平台,3d打印图纸下载"
    if @product
      keywords += ",#{@product.name}"
      keywords += ",#{@product.category.name}" unless @product.category.nil?
    end
     
    return keywords
  end
  
  def get_description    
    if @product
      dscp = "产品说明: " + @product.desc unless @product.desc.nil?
    else
      dscp =  "3d图纸库(3dtzk.com),是中国最大的3d打印机图纸设计、分享、下载平台，包括艺术品，首饰品，小工具，各种玩具、游戏、动漫等人物模型的3d设计图纸。"
    end
    
    return dscp
  end
  
  def get_head_title
    #产品-分类-网站名称
    title = "技师点单系统"
  end
end
