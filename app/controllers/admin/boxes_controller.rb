class Admin::BoxesController < Admin::BaseController
  layout 'admin'
  before_filter :authenticate_admin!
  load_and_authorize_resource
  
  # GET /boxes
  # GET /boxes.json
  def index
    @boxes = Box.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /boxes/1
  # GET /boxes/1.json
  def show
    @box = Box.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
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
    @box = Box.find(params[:id])
    @result = @box.result
    #@box.build_result
  end

  # POST /boxes
  # POST /boxes.json
  def create
    @box = Box.new(params[:box])

    respond_to do |format|
      if @box.save
        @result = @box.build_result(params[:result])
        @result.save
        format.html { redirect_to [:admin,@box], :notice => 'Box was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /boxes/1
  # PUT /boxes/1.json
  def update
    @box = Box.find(params[:id])
    @result = @box.result

    respond_to do |format|
      if @box.update_attributes(params[:box])
        @result.update_attributes(params[:result])
        format.html { redirect_to [:admin,@box], :notice => 'Box was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /boxes/1
  # DELETE /boxes/1.json
  def destroy
    @box = Box.find(params[:id])
    @box.destroy

    respond_to do |format|
      format.html { redirect_to boxes_url }
    end
  end
end
