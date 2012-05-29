class HomeController < ApplicationController
  
  def index
  end
  
  def results
    if params[:tipo_consulta]== 'casilla'
      @results = Box.select('id').where('state_id = ? AND municipality_id =? AND number = ? AND active = ?',params[:state_id],params[:municipality_id],params[:numero_casilla],true).first
      if @results == nil
        redirect_to '/search',:message => "No se encontro la casilla" #En caso de que no halla la casilla
        return false
      else
        redirect_to '/casilla/'+@results.id.to_s
        return false
      end
    elsif params[:tipo_consulta]== 'estado'
      redirect_to '/estado/'+params[:state_id].to_s
      return false
    else
      redirect_to '/search', :notice=>'No especificaste datos de busqueda'
      return false
    end#end if params[:tipo_consulta].present?
    
  end
  
  def box
    @box = Box.find_by_id_and_active(params[:id],true)
  end

  def state
    @results = Box.where('state_id = ? AND active = ?',params[:id],true).all
  end

  def enviar
    @box = Box.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def save_results
    if simple_captcha_valid?
      params[:box][:active] = true
      @box = Box.new(params[:box])
      respond_to do |format|
        if @box.save
          format.html { redirect_to '/casilla/'+@box.id.to_s, :notice => 'La casilla fue correctamente capturada.' }
        else
            format.html { render :action => "enviar" }
        end#end if @box.save
      end#end respond_to do |format|
    else
      redirect_to '/send', :notice=>'Captcha Incorrecto'
    end
    
  end
  
  def search
    @states = State.all
  end
  
  def get_municipalities
    if params[:state].present?
      @municipalities = Municipality.where('state_id = ?',params[:state]).all
      
      respond_to do |format|
        format.js
      end#end respond_to do |format|
    end#end if params[:state].present?
    
  end
  
  def nacional
    @results = Box.where('active = ?',true).all
  end
  
end