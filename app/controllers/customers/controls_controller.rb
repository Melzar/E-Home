class Customers::ControlsController < ApplicationController

  def index
    controls = Control.for_customer(current_user.customer).all
    render_json_response(controls, [:control_type, space: [:space_type]])
  end

  def create
    control =  Control.new(post_params)
    if !control.save
      render_json_response(control, :unprocessable_entity)
      return
    end
    render_response :ok
  end

  def update
    control = control_from_params
    if !control.update(post_params)
      render_json_response(control, :unprocessable_entity)
    end
    render_response :ok
  end

  private

  def control_from_params
    control = Control.for_customer(current_user.customer).find_by_id(params[:id])
    if control.blank?
      render_response(:unauthorized_access)
      return
    end
    control
  end

  def post_params
    ActiveModelSerializers::Deserialization.jsonapi_parse!(params.to_unsafe_h,
                                                           only: [
                                                               :name,
                                                               :status,
                                                               :uuid,
                                                               'control-type',
                                                               :space
                                                           ])
  end

end
