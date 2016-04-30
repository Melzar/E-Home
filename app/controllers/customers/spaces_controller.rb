class Customers::SpacesController < ApiController

  def index

  end

  def update
    space = space_from_params
    if !space.update(post_params)
      render_json_response(space,:unprocessable_entity)
      return
    end
    render_response :ok
  end

  def create
    space = Space.new(post_params)
     if !space.save
       render_json_response(space, :unprocessable_entity)
       return
     end
     render_response :ok
  end

  def show
    space = space_from_params
    render_json_response(space)
  end

  def get_space_types
    space_type = SpaceType.all
    render_json_response(space_type)
  end

  private

  def space_from_params
    space = Space.for_customer(current_user.customer).find_by_id(params[:id])
    if space.blank?
      render_response(:unauthorized)
      return
    end
    space
  end

  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h,
                                                           only: [
                                                               :name,
                                                               'space-type',
                                                               :accomodation
                                                           ])
  end
end
