class ItemsController < ApplicationController

	before_filter :login_required, :except => [:index, :show]
	before_filter :check_admin, :except => [:index, :show]

  # GET /items
  # GET /items.xml
  def index

	if logged_in? and current_user.admin?
 	 @search = Item.joins(:produto).search(params[:search])
	 @items = @search.order("id").scoped.paginate(:page => params[:page], :per_page=>20)
	else
 	 @search = Item.joins(:produto).favoravel.search(params[:search])
	 @items = @search.order("id").scoped.paginate(:page => params[:page], :per_page=>20)
	end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items.to_xml(:include => {:parecer=>{}, :marca=>{},:produto => {:include => :grupo}})}
      
      
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
