module ApplicationHelper
  def admin_signed_in?
    current_user.admin? if user_signed_in?
  end
  
  def current_signed_in?(user)
    current_user == user if user_signed_in?
  end
  
  def current_list_set?
    !session[:list].nil?
  end
  
  def current_list
    session[:list]
  end
end
