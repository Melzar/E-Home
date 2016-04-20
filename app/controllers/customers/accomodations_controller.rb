class Customers::AccomodationsController < ApiController

  def index

    render_response(nil, :ok)
  end

  def create
    Accomodation.new(post_params).save!
    render_json_response(nil, :ok)
  end

  private
  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h)
  end

end
