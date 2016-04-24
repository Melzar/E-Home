class Customers::AccomodationsController < ApiController

  def index
    accomodations = Accomodation.for_customer(current_user.customer).map do |accomodation| accomodation end
    render_json_response(accomodations)
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
      render_json_response(nil)
    end
  end

  def get_accomodation_types
    accomodation_types = AccomodationType.all
    render_json_response(accomodation_types)
  end

  private
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
