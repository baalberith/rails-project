module ApplicationHelper
  def page_title
    base_title = "Project"
    if @page_title.nil?
      base_title
    else
      "#{base_title} | #{@page_title}"
    end
  end
  
  def logo_tag
    image_tag "rails.png", :alt => @page_title
  end
  
  def admin_signed_in?
    current_user.admin? if user_signed_in?
  end
  
  def current_signed_in?(user)
    current_user == user if user_signed_in?
  end
  
  def any_lists?
    current_user.lists.any?
  end
end
