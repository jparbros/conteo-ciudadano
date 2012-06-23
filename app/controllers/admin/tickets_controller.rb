class Admin::TicketsController < Admin::BaseController
  before_filter :authenticate_admin!
  layout 'admin'
  load_and_authorize_resource
  
   # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ti = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:Ticket])

    respond_to do |format|
      if @ticket.save
        @result = @ticket.build_result(params[:result])
        @result.save
        format.html { redirect_to [:admin,@ticket], :notice => 'Ticket was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:Ticket])
        format.html { redirect_to [:admin,@ticket], :notice => 'Ticket was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to admin_tickets_url }
    end
  end
  
end