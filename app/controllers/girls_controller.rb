class GirlsController < InheritedResources::Base
  before_filter :authenticate_user!, :except =>[:show]
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
end
