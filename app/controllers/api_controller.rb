class ApiController < ApplicationController

  def render_json_response(response=nil, opts={}, meta=nil)
    if response.is_a?(ActiveRecord::Base) && (response.errors.present? && response.errors.any?)
      render json: {errors: response.errors.map{ |k,v|
        {
            source: { pointer: "data/attributes/#{k}" },
            title: v
        }
      }}, status: :unprocessable_entity
    else
      render json: response, status: :ok, include: opts, extra: meta
    end
  end

  def render_response(status)
      render json: nil, status: status
  end


end
