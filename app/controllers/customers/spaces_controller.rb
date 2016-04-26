class Customers::SpacesController < ApiController

  def index

  end

  def show
    space = Space.for_customer(current_user.customer).find_by_id(params[:id])
    if(space.blank?)
      render_response(:unauthorized)
      return
    end
    render_json_response(space)
  end
end
