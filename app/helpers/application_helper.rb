module ApplicationHelper
  def admin_signed_in?
    current_user.admin? if user_signed_in?
  end
end
