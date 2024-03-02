class SessionsController < ApplicationController
  def create
    # authenticate user
    @user = User.find_by({ "email" => params["email"]})
    if @user != nil
        if BCrypt::Password.new(@user["password"]) == params["password"]
          session["user_id"] = @user["id"]
          flash["notice"] = "Welcome, #{@user["username"]}."
          redirect_to "/places"
        else
          flash["notice"] = "Wrong username or password."
          redirect_to "/login"
        end
    end
  end

  def new
  end

    #logout user
  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end

 
end

  