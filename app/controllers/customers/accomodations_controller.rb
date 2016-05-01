class Customers::AccomodationsController < ApiController

  def index
    accomodations = Accomodation.for_customer(current_user.customer).map do |accomodation| accomodation end
    render_json_response(accomodations, [:accomodation_type, :spaces])
  end

  def create
    ActiveRecord::Base.transaction do
      accomodation = Accomodation.new(post_params)
      if(!accomodation.save)
        render_json_response(accomodation)
        raise ActiveRecord::Rollback
      end
      customer_accomodation = CustomerAccomodation.create(accomodation: accomodation, customer: current_user.customer)
      if(!customer_accomodation.save)
        render_json_response(customer_accomodation)
        raise ActiveRecord::Rollback
      end
      render_response :ok
    end
  end

  def show
    accomodation = accomodation_from_params
    render_json_response(accomodation, [:accomodation_type, spaces: [:space_type]])
  end

  def update
    accomodation = accomodation_from_params
    accomodation.update_attributes(post_params)
    render_response :ok
  end

  def destroy
    accomodation = accomodation_from_params
    if !accomodation.destroy
      render_json_response(accomodation, :unprocessable_entity)
    end
    render_response :ok
  end

  def get_accomodation_types
    accomodation_types = AccomodationType.all
    render_json_response(accomodation_types)
  end

  private

  def accomodation_from_params
    accomodation = Accomodation.for_customer(current_user.customer).find_by_id(params[:id])
    if(accomodation.blank?)
      render_response(:unprocessable_entity)
      return
    end
    accomodation
  end

  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h,
                                                           only: [
                                                               :name,
                                                               'address-1',
                                                               'address-2',
                                                               :city,
                                                               :zip,
                                                               :latitude,
                                                               :longitude,
                                                               'accomodation-type'
                                                           ])
  end
end
