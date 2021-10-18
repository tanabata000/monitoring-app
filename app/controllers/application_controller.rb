class ApplicationController < ActionController::Base
  before_action :configure_company_permitted_parameters, if: :devise_controller?
  before_action :configure_tester_permitted_parameters, if: :devise_controller?
  
  private
  def configure_company_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:company_image, :company_name, :company_name_kana, :department, :postal_code, :prefecture_id, :city, :address, :building, :phone_number])
  end
  def configure_tester_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :last_name_kana, :first_name, :first_name_kana, :sex_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number])
  end

end
