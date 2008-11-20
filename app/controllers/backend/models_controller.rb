class Backend::ModelsController < Backend::BackendController

  before_filter :pre_load

  def index
    models = current_inventory_pool.models

    if @model
      models = models & @model.compatibles
    end    

    case params[:filter]
      when "packages"
        models = models.packages
    end
    
    unless params[:query].blank?
      @models = models.search(params[:query], :page => params[:page], :per_page => $per_page)
    else
      @models = models.paginate :page => params[:page], :per_page => $per_page
    end
    
    render :layout => $modal_layout_path if params[:layout] == "modal"
  end

  def show
    redirect_to :action => 'show_package', :model_id => @model if @model.is_package?
    # TODO 30** remove 'details' view. refactor widget_tabs
    render :action => 'details', :layout => $modal_layout_path if params[:layout] == "modal"
  end
  
  def create
    if @model and params[:compatible][:model_id]
      @compatible_model = current_inventory_pool.models.find(params[:compatible][:model_id])
      unless @model.compatibles.include?(@compatible_model)
        @model.compatibles << @compatible_model
        flash[:notice] = _("Model successfully added as compatible")
      else
        flash[:error] = _("The model is already compatible")
      end
      redirect_to :action => 'index', :model_id => @model
    end
  end

  def destroy
    if @model and params[:id]
        @model.compatibles.delete(@model.compatibles.find(params[:id]))
        flash[:notice] = _("Compatible successfully removed")
        redirect_to :action => 'index', :model_id => @model
    end
  end
  
#################################################################

  def show_package 
  end

  def new_package
    @model = Model.new
    render :action => 'show_package' #, :layout => false
  end

  def update_package(name = params[:name], inventory_code = params[:inventory_code])
    @model ||= Model.new
    @model.name = name
    @model.save 
    @model.items.create(:location => current_inventory_pool.main_location) if @model.items.empty?
    @model.items.first.update_attribute(:inventory_code, inventory_code)
    redirect_to :action => 'show_package', :id => @model
  end

  def add_package_item
    @model.items.first.children << @item
    redirect_to :action => 'show_package', :id => @model
  end

  def remove_package_item
    @model.items.first.children.delete(@item)
    redirect_to :action => 'show_package', :id => @model
  end

#################################################################

  def available_items
    # OPTIMIZE prevent injection
    a_items = current_inventory_pool.items.find(:all, :conditions => ["model_id IN (#{params[:model_ids]}) AND inventory_code LIKE ?", '%' + params[:code] + '%'])
    # OPTIMIZE check availability
    @items = a_items.select {|i| i.in_stock? }
    
    render :inline => "<%= auto_complete_result(@items, :inventory_code) %>"
  end
  
#################################################################

  def properties
  end

#################################################################

  def accessories
  end
  
  def set_accessories(accessory_ids = params[:accessory_ids] || [])
    @current_inventory_pool.accessories -= @model.accessories
    
    accessory_ids.each do |a|
      @current_inventory_pool.accessories << @model.accessories.find(a.to_i)
    end
    redirect_to :action => 'accessories', :id => @model
  end
  
#################################################################

  def images
  end

#################################################################

  def auto_complete
    @models = current_inventory_pool.models.search(params[:query])
    render :partial => 'auto_complete'
  end

  private
  
  def pre_load
    params[:model_id] ||= params[:id] if params[:id]
    @model = current_inventory_pool.models.find(params[:model_id]) if params[:model_id]
    @item = current_inventory_pool.items.find(params[:item_id]) if params[:item_id]
    @model = @item.model if @item and !@model
  end

end
