class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def comfirm_required
    if !current_user.comfirm?
      redirect_to "/"
    end
  end
  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end
end
