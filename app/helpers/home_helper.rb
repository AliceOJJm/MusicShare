module HomeHelper
  def get_locale
    cookies[:locale].to_s
  end
end
