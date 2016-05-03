class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    if current_user.present? && params[:user].blank?
      render json: nil, status: :ok
      return
    end

    if current_user.present? && params[:user].present?
      sign_out(current_user)
    end

    super do |user|
      if request.format.json?
        render json: prepare_data(user), status: :created and return
      end
    end
  end

  private

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