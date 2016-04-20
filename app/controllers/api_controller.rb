
class ApiController < ApplicationController


  def render_json_response(response, status)
    render json: response, status: status
  end


end
