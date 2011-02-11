class FabricantesController < ApplicationController
  # GET /fabricantes
  # GET /fabricantes.xml
  def index
    @fabricantes = Fabricante.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fabricantes }
    end
  end

  # GET /fabricantes/1
  # GET /fabricantes/1.xml
  def show
    @fabricante = Fabricante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fabricante }
    end
  end

  # GET /fabricantes/new
  # GET /fabricantes/new.xml
  def new
    @fabricante = Fabricante.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fabricante }
    end
  end

  # GET /fabricantes/1/edit
  def edit
    @fabricante = Fabricante.find(params[:id])
  end

  # POST /fabricantes
  # POST /fabricantes.xml
  def create
    @fabricante = Fabricante.new(params[:fabricante])

    respond_to do |format|
      if @fabricante.save
        format.html { redirect_to(@fabricante, :notice => 'Fabricante was successfully created.') }
        format.xml  { render :xml => @fabricante, :status => :created, :location => @fabricante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fabricante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fabricantes/1
  # PUT /fabricantes/1.xml
  def update
    @fabricante = Fabricante.find(params[:id])

    respond_to do |format|
      if @fabricante.update_attributes(params[:fabricante])
        format.html { redirect_to(@fabricante, :notice => 'Fabricante was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fabricante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fabricantes/1
  # DELETE /fabricantes/1.xml
  def destroy
    @fabricante = Fabricante.find(params[:id])
    @fabricante.destroy

    respond_to do |format|
      format.html { redirect_to(fabricantes_url) }
      format.xml  { head :ok }
    end
  end
end
