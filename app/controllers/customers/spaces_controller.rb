class Customers::SpacesController < ApiController

  def index

  end

  def create
     render_json_response
  end

  def show
    space = Space.for_customer(current_user.customer).find_by_id(params[:id])
    if(space.blank?)
      render_response(:unauthorized)
      return
    end
    render_json_response(space)
  end

  def get_space_types
    space_type = SpaceType.all
    render_json_response(space_type)
  end
end
