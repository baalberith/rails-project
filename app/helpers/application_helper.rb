module ApplicationHelper
  def admin_signed_in?
    current_user.admin? if user_signed_in?
  end
  
  def current_signed_in?(user)
    current_user == user if user_signed_in?
  end
  
  def current_list_id_set?
    !session[:list_id].nil?
  end
  
  def current_list_id
    session[:list_id]
  end
  
  def current_list
    List.find(session[:list_id])
  end
  
  def list_selected?(list_id)
    session[:list_id] == list_id
  end
  
  def meanings_of_word_on_a_list(word_meanings, list_meanings)
    meanings = []
    for meaning in word_meanings
      meanings << meaning if list_meanings.include?(meaning)
    end
    meanings
  end
end
