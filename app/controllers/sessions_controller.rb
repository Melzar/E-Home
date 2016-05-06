class SessionsController < Devise::SessionsController

  prepend_before_action :require_no_authentication, :only => [:create]

  respond_to :html, :json

  def create
    if current_user.present? && params[:user].blank?
      render json: nil, status: :ok
      return
    end

    if current_user.blank? && params[:user].blank?
      render json: nil, status: :unauthorized and return
    end

    if current_user.present? && params[:user].present?
      sign_out(current_user)
    end

    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in('user', resource)
      render json: prepare_data(resource), status: :created and return
    end
    invalid_login_attempt
  end

  def destroy
    sign_out(resource_name)
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: {success: false, message: 'Invalid login or password'}, status: :unauthorized
  end

  def prepare_data(user)
    data = {
        token: user.authentication_token,
        email: user.email
    }
    if user.customer.present?
      data[:name] = user.customer.first_name
    end
    data
  end
end



