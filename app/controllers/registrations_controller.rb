class RegistrationsController < Devise::RegistrationsController
  #因為增加Devise欄位,因此要繼承Devise::RegistrationsController並覆寫原來的方法，讓新增的欄位可以通過
  private
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
