# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_up_path_for(resource)
    return poster_url
    stored_location_for(resource) ||
      if resource.is_a?(User)
        poster_url
      else
        super
      end
  end
end
