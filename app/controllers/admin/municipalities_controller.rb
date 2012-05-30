class Admin::MunicipalitiesController < Admin::BaseController

  # GET /municipalities
  # GET /municipalities.json
  def index
    @municipalities = Municipality.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /municipalities/1
  # GET /municipalities/1.json
  def show
    @municipality = Municipality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /municipalities/new
  # GET /municipalities/new.json
  def new
    @municipality = Municipality.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /municipalities/1/edit
  def edit
    @municipality = Municipality.find(params[:id])
  end

  # POST /municipalities
  # POST /municipalities.json
  def create
    @municipality = Municipality.new(params[:municipality])

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to @municipality, :notice => 'Municipality was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /municipalities/1
  # PUT /municipalities/1.json
  def update
    @municipality = Municipality.find(params[:id])

    respond_to do |format|
      if @municipality.update_attributes(params[:municipality])
        format.html { redirect_to @municipality, :notice => 'Municipality was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /municipalities/1
  # DELETE /municipalities/1.json
  def destroy
    @municipality = Municipality.find(params[:id])
    @municipality.destroy

    respond_to do |format|
      format.html { redirect_to municipalities_url }
    end
  end
end
