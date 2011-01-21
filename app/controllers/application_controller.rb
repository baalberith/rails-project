class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_list_id!
  
  private
  
    def set_current_list_id!
      list_id = session[:list_id]
      unless list_id.nil? 
        list = current_list
        unless list.user == current_user
          session[:list_id] = nil 
        end
      end
    end
    
    def current_list
      List.find(session[:list_id])
    end
end
