class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    cookies[:cookietest] = true
    if ! cookies[:username].nil?
      @user = cookies[:username]
      render :action => "welcome"
    end
  end
  
  def login
    if params[:username] == "CSisCoolStuff" && params[:password] == "CSisCoolStuff"
      if params[:remember] == "on"
        cookies[:username] = {:value => params[:username], :expires => Time.now + 6.months}
        cookies[:password] = {:value => params[:password], :expires => Time.now + 6.months}
        if cookies[:cookietest].blank?
          @error = "Cookies must be enabled to log in automatically"
        end
      end
    else
      @error = "Login unseccessful, please review your credentials."
      if params[:remember] == "on"
        @isChecked = "checked='checked'"
      else
        @isChecked = ""
      end
      render :action => 'index'
    end
  end
  
  def welcome
  end
end
