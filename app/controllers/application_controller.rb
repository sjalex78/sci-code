# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_up_path_for(resource)
    return poster_url
    stored_location_for(resource) ||
      if resource.is_a?(User)
        poster_url
      else
        super
      end
  end

  # def after_sign_out_path(resource)
  #   root_path
  # end
end
