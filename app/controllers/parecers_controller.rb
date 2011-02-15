class ParecersController < ApplicationController

	before_filter :login_required #, :except => [:index, :show]
	before_filter :check_admin #, :except => [:index, :show]


  # GET /parecers
  # GET /parecers.xml
  def index
    @parecers = Parecer.scoped.paginate(:page => params[:page], :per_page=>20)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parecers }
    end
  end

  # GET /parecers/1
  # GET /parecers/1.xml
  def show
    @parecer = Parecer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parecer }
    end
  end

  # GET /parecers/new
  # GET /parecers/new.xml
  def new
    @parecer = Parecer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parecer }
    end
  end

  # GET /parecers/1/edit
  def edit
    @parecer = Parecer.find(params[:id])
  end

  # POST /parecers
  # POST /parecers.xml
  def create
    @parecer = Parecer.new(params[:parecer])

    respond_to do |format|
      if @parecer.save
        format.html { redirect_to(@parecer, :notice => 'Parecer criado com sucesso.') }
        format.xml  { render :xml => @parecer, :status => :created, :location => @parecer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parecer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parecers/1
  # PUT /parecers/1.xml
  def update
    @parecer = Parecer.find(params[:id])

    respond_to do |format|
      if @parecer.update_attributes(params[:parecer])
        format.html { redirect_to(@parecer, :notice => 'Parecer alterado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parecer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parecers/1
  # DELETE /parecers/1.xml
  def destroy
    @parecer = Parecer.find(params[:id])
    @parecer.destroy

    respond_to do |format|
      format.html { redirect_to(parecers_url) }
      format.xml  { head :ok }
    end
  end
end
