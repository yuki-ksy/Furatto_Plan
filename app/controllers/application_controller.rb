class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if params[:user] != nil
      params[:user][:gender] = params[:user][:gender].to_i
    end
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :user_name, :gender])
  end
end
