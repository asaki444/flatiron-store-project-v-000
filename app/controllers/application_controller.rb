require 'pry'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
  helper do 
    def current_cart
      if current_user
       current_user.current_cart ||= false
      end
    end
  end
end
