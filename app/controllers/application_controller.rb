class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_list_id!
  helper_method :current_list, :current_list_id, :current_list_id_set?
  
  protected
  
    # sets session[:list_id] to last value or first list id if session expires
    def set_current_list_id!
      # session[:list_id] = nil
      if session[:list_id].nil? 
        if user_signed_in?
          lists = current_user.lists
          session[:list_id] = lists.first.id if lists.any?
        end
      else
        if user_signed_in?
          list = current_list
          session[:list_id] = nil unless list.user == current_user
        end
      end
    end
    
    # finds list of session[:list_id] id
    def current_list
      List.find(session[:list_id])
    end
    
    # returns session[:list_id]
    def current_list_id
      session[:list_id]
    end
    
    # checks whether session[:list_id] is set
    def current_list_id_set?
      !session[:list_id].nil? if user_signed_in?
    end
    
    # sets current value of session[:list_id]
    def set_current_list_id(list_id)
      session[:list_id] = list_id == 0 ? nil : list_id
    end
end
