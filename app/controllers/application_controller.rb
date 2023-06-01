# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    raise NotAuthorized.new unless request.headers["Device-Token"]
    @current_user = User.find_or_create_by!(token: request.headers["Device-Token"])
  end

  def current_user_id
    @current_user_id = @current_user.id
  end

  NotAuthorized = Class.new(StandardError)
end
