class Backend::LocationsController < Backend::BackendController

  before_filter :pre_load

  def index
    params[:sort] ||= 'room'
    params[:dir] ||= 'ASC'

    @locations = current_inventory_pool.locations.search(params[:query], {:page => params[:page], :per_page => $per_page}
                                                                       # TODO 0501 , {:order => sanitize_order(params[:sort], params[:dir])}
                                                                        )
  end

  def show
    @location ||= Location.new
  end

  # TODO 1108** still used?
  def create
    @location = Location.new
    update
  end

  # TODO 1108** still used?
  def update
    @location.update_attributes(params[:location])
    redirect_to(backend_inventory_pool_locations_path)
  end

  def destroy
    @location.destroy
    redirect_to(backend_inventory_pool_locations_path)
  end

#################################################################

  private
  
  def pre_load
    params[:id] ||= params[:location_id] if params[:location_id]
    @location = current_inventory_pool.locations.find(params[:id]) if params[:id]

    @tabs = []
    @tabs << :location_backend if @location
  end

end
  
