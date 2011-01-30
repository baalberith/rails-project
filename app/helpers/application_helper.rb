module ApplicationHelper
  # helper for make page title
  def page_title
    base_title = "Project"
    if @page_title.nil?
      base_title
    else
      "#{base_title} | #{@page_title}"
    end
  end
  
  # returns image tag with logo
  def logo_tag
    image_tag "rails.png", :alt => @page_title
  end
  
  # checks whether admin user is signed in
  def admin_signed_in?
    current_user.admin? if user_signed_in?
  end
  
  # checks whether user is current user
  def current_signed_in?(user)
    current_user == user if user_signed_in?
  end
  
  # checks whether current user has any words lists
  def any_lists?
    current_user.lists.any?
  end
end
