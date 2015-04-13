class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_locale
  helper :all

  def set_locale
    if cookies[:locale] && I18n.available_locales.include?(cookies[:locale].to_sym)
      language = cookies[:locale].to_sym
    else
      language = I18n.default_locale
      cookies.permanent[:locale] = language
    end
    I18n.locale = language
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
