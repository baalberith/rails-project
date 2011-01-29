class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_list_id!
  
  helper_method :current_list, :current_list_id, :current_list_id_set?
  
  protected
  
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
    
    def current_list
      List.find(session[:list_id])
    end
    
    def current_list_id
      session[:list_id]
    end
    
    def current_list_id_set?
      !session[:list_id].nil? if user_signed_in?
    end
    
    def set_current_list_id(list_id)
      session[:list_id] = list_id == 0 ? nil : list_id
    end
end
