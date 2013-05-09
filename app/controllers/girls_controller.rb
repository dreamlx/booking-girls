class GirlsController < InheritedResources::Base
  before_filter :authenticate_user!, :except =>[:show, :nextpage, :prepage]
  def index
    @girls = Girl.order("created_at desc").paginate(page: params[:page], per_page: 30)
  end
  
  def show
    @girl = Girl.find(params[:id])
    @task = @girl.tasks.last
    render :layout => "ios" if session[:user_agent].platform == 'iPad'
  end
  
  def leave
    @girl = Girl.find(params[:id])
    @girl.get_off
    redirect_to girl_url(@girl)
  end
  
  def atwork
    @girl = Girl.find(params[:id])
    @girl.come_back
    redirect_to girl_url(@girl)
  end
  
  def prepage
    id = params[:id].to_i - 1
    @girl = nil
    while @girl.nil? and id > 0
      @girl = Girl.where(["id = ?", id]).first
      id = id - 1
    end
    
    if !@girl.nil?
      redirect_to girl_url(@girl)
    else
      redirect_to root_url
    end
  end
  
  def nextpage
    id = params[:id].to_i + 1
    @girl = nil
    last_id = Girl.last.id
    while @girl.nil? and id <= last_id
      @girl = Girl.where(["id = ?", id]).first
      id = id + 1
    end
    
    if !@girl.nil?
      redirect_to girl_url(@girl)
    else
      redirect_to root_url
    end
    
  end
end
