class Admin::BoxesController < Admin::BaseController
  load_and_authorize_resource

  # GET /boxes
  # GET /boxes.json
  def index
    if params[:state].present? && params[:section].present?
      @boxes = Box.by_state_and_section(params[:state], params[:section]).page(params[:page])

    else
      @boxes = Box.page(params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @box = CasillaPresenter.new Box.find(params[:id])
  end

  # GET /boxes/new
  # GET /boxes/new.json
  def new
    @box = Box.new
    @result = @box.build_result

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /boxes/1/edit
  def edit
    @box = CasillaPresenter.new Box.find(params[:id])
    @box.result_images.build if @box.result_images.blank?
  end

  def update
    @box = Box.find(params[:id])

    if @box.update_attributes(params[:box])
      redirect_to [:admin,@box], :notice => 'Box was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    redirect_to boxes_url
  end

end