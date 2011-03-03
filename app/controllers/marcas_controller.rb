class MarcasController < ApplicationController

#	before_filter :login_required #, :except => [:index, :show]
#	before_filter :check_admin #, :except => [:index, :show]


  # GET /marcas
  # GET /marcas.xml
  def index

	 @search = Marca.search(params[:search])
	 @marcas = @search.order("id").scoped.paginate(:page => params[:page], :per_page=>20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @marcas }
    end
  end

  # GET /marcas/1
  # GET /marcas/1.xml
  def show
    @marca = Marca.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @marca }
    end
  end

  # GET /marcas/new
  # GET /marcas/new.xml
  def new
    @marca = Marca.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @marca }
    end
  end

  # GET /marcas/1/edit
  def edit
    @marca = Marca.find(params[:id])
  end

  # POST /marcas
  # POST /marcas.xml
  def create
    @marca = Marca.new(params[:marca])

    respond_to do |format|
      if @marca.save
        format.html { redirect_to(@marca, :notice => 'Marca criada com sucesso.') }
        format.xml  { render :xml => @marca, :status => :created, :location => @marca }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marca.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /marcas/1
  # PUT /marcas/1.xml
  def update
    @marca = Marca.find(params[:id])

    respond_to do |format|
      if @marca.update_attributes(params[:marca])
        format.html { redirect_to(@marca, :notice => 'Marca alterada com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marca.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /marcas/1
  # DELETE /marcas/1.xml
  def destroy
    @marca = Marca.find(params[:id])
    @marca.destroy

    respond_to do |format|
      format.html { redirect_to(marcas_url) }
      format.xml  { head :ok }
    end
  end
end
