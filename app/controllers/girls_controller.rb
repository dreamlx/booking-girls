class GirlsController < InheritedResources::Base
  before_filter :authenticate_user!, :except =>[:show, :nextpage, :prepage, :booking]
  def index
    @girls = Girl.order("created_at desc").paginate(page: params[:page], per_page: 30)
  end
  
  def show
    @girl = Girl.find(params[:id])
    @task = @girl.tasks.last
    girls = Girl.all
    current_index = girls.index(@girl)
    pre_index     = current_index == 0 ? current_index : (current_index - 1)
    next_index    = current_index == (girls.size - 1) ? current_index : (current_index + 1)

    @current_id = @girl.id
    @pre_id = girls[pre_index].id
    @next_id = girls[next_index].id

    render :layout => "ios" if session[:user_agent].platform == 'iPad'
  end
  
  def leave
    @girl = Girl.find(params[:id])
    @girl.get_off
    redirect_to girl_url(@girl)
  end
  
  def booking
    @girl = Girl.find(params[:id])
    @girl.book_me
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
