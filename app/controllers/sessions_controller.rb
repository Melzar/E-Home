class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super do |user|
      if request.format.json?
        data = {
            token: user.authentication_token,
            email: user.email
        }
        if user.customer.present?
          data[:name] = user.customer.first_name
        end

        render json: data, status: 201 and return
      end
    end
  end
end