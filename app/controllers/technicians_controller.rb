class TechniciansController < InheritedResources::Base
  before_filter :authenticate_user!, :except =>[:show, :nextpage, :prepage, :booking]
  before_filter :check_technicians_state, :only => [:show]
  before_filter :set_current_user
  def index
    @technicians = @current_company.technicians.order("created_at desc").paginate(page: params[:page], per_page: 30)
  end
  
  def show
    @technician = Technician.find(params[:id])
    @task = @technician.tasks.last
    gon.services = ServiceMenu.all.to_json
  end
  
    def update
    @technician         = Technician.find(params[:id])
    if @technician.update_attributes(params[:technician])
      redirect_to technician_url(@technician)
    else
      render :edit
    end
  end

  def leave
    @technician = Technician.find(params[:id])
    @technician.get_off
    redirect_to technician_url(@technician)
  end
  
  def booking
    @technician = Technician.find(params[:id])
    @technician.state == 'pending' ? @technician.book_me : @technician.cancel_book
    redirect_to technician_url(@technician)
  end

  def atwork
    @technician = Technician.find(params[:id])
    @technician.come_back
    redirect_to technician_url(@technician)
  end

  # comments
  def comments
    @comments = Technician.find(params[:id]).comments
  end

  def add_comment
    p = Technician.find(params[:id])
    c = Comment.new(params[:comment])
    c.user_id = current_user.id
    c.save
    p.comments << c
    redirect_to technician_path(p), notice: 'Comment was successfully added.'
  end

  def remove_comment
    c = Comment.find(params[:comment_id])
    p =  Technician.find(params[:id])
    p.comments.delete(c)
    redirect_to technician_path(p), notice: 'Comment was successfully deleted.'
  end

end
