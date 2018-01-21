class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    # check if user can save
    if @user.save
      # add a login session that keeps hold of that user
      session[:user_id] = @user.id

      # let the user know they've signed up
      flash[:success] = "Welcome to Source"

      # redirect to the homepage
      redirect_to root_path
    else
      # if there is an error, render new.html.erb
      render "new"
    end
  end

  def form_params
    params.require(:user).permit(:name, :username, :email,
      :password, :password_confirmation)
  end

end
