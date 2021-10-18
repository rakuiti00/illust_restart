class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:profile,:twitter_url,:pixiv_url,:another_url,:image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:profile,:twitter_url,:pixiv_url,:another_url,:image])

  end

end