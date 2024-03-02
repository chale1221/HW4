class UsersController < ApplicationController
 
  def show
    @user = User.find_by({"id" => params["id"]})
  end
 
 
  def new
  end

  def create
      if User.find_by({ "email" => params["email"]}) == nil
        @user = User.new
        @user["username"] = params["username"]
       # @user["first_name"] = params["first_name"]
        #@user["last_name"] = params["last_name"]
        @user["email"] = params["email"]
        @user["password"] = params["password"]
      # encrypt before storing
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/login"
    else
    flash["notice"] = "Email taken."
    redirect_to "/users/new"
    end
  end
end
