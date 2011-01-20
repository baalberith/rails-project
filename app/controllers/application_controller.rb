class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_current_list!
  
  private
  
    def set_current_list!
      list = session[:list]
      unless list.nil? or list.user == current_user
        session[:list] = nil 
      end
    end
    
    def current_list
      session[:list]
    end
end
