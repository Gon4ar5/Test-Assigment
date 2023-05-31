class ApplicationController < ActionController::Base
  def current_user
  	@current_user = User.find_or_create_by!(token: request.headers["Device-Token"])
  end

  def current_user_id
  	@current_user_id = @current_user.id
  end
end
