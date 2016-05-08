class Customers::ControlsController < ApiController

  def index
    controls = Control.for_customer(current_user.customer)
    render_json_response(controls, [:control_type, space: [:space_type]], { lol: 'lol'})
  end

  def show
    control = control_from_params
    control_logs = control.control_logs.limit(10)
    result = {
        labels: [],
        data: [],
    }
    control_logs.map do |control_log|
        result[:labels].push(control_log.created_at)
        result[:data].push(control_log.value)
    end
    render_json_response(control, [:space, :control_type, :control_logs], result)
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

  def destroy
    control = control_from_params
    if !control.destroy
      render_json_response(control, :unprocessable_entity)
    end
    render_response :ok
  end

  def get_control_types
    control_types = ControlType.all
    render_json_response(control_types)
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
                                                               :state,
                                                               :uuid,
                                                               'control-type',
                                                               :space
                                                           ])
  end

end
