class GirlsController < InheritedResources::Base
  before_filter :authenticate_user!, :except =>[:show, :nextpage, :prepage, :booking]
  before_filter :check_girls_state, :only => [:show]
  before_filter :set_current_user
  def index
    @girls = @current_company.girls.order("created_at desc").paginate(page: params[:page], per_page: 30)
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
    gon.services = ServiceMenu.all.to_json
  end
  
    def update
    @girl         = Girl.find(params[:id])
    if @girl.save
      redirect_to girl_url(@girl)
    else
      render :edit
    end
  end

  def leave
    @girl = Girl.find(params[:id])
    @girl.get_off
    redirect_to girl_url(@girl)
  end
  
  def booking
    @girl = Girl.find(params[:id])
    @girl.state == 'pending' ? @girl.book_me : @girl.cancel_book
    redirect_to girl_url(@girl)
  end

  def atwork
    @girl = Girl.find(params[:id])
    @girl.come_back
    redirect_to girl_url(@girl)
  end

  # comments
  def comments
    @comments = Girl.find(params[:id]).comments
  end

  def add_comment
    p = Girl.find(params[:id])
    c = Comment.new(params[:comment])
    c.user_id = current_user.id
    c.save
    p.comments << c
    redirect_to girl_path(p), notice: 'Comment was successfully added.'
  end

  def remove_comment
    c = Comment.find(params[:comment_id])
    p =  Girl.find(params[:id])
    p.comments.delete(c)
    redirect_to girl_path(p), notice: 'Comment was successfully deleted.'
  end

end
