class ApiController < ApplicationController

  def render_json_response(response)

    if response.is_a?(ActiveRecord::Base) && (response.errors.present? && response.errors.any?)
      render json: {errors: response.errors.map{ |k,v|
        {
            source: { pointer: "data/attributes/#{k}" },
            title: v
        }
      }}, status: :unprocessable_entity
    else
      render json: response, status: :ok
    end

  end


end
