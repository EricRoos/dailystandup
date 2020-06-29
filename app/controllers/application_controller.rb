class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_raven_context
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end

  private

  def set_raven_context
    if Rails.env.production?
      Raven.user_context(id: session[:current_user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
  end

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end


  def current_team_member
    return unless @team.present?
    @current_team_member ||= TeamMember.where(team_id: @team.id, user_id: current_user.id).first
  end
  helper_method :current_team_member
end
