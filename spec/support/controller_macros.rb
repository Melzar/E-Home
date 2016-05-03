module ControllerMacros

  def login_user(user)
    sign_in user
  end

end

RSpec.configure do |config|
  config.include ControllerMacros
end