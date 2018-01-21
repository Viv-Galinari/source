class SessionsController < ApplicationController

  def new
    # we don't need any variable here
    #  because we are not saving to the database, just a new session
  end

  def create
    @username = form_params[:username]
    @password = form_params[:password]

    # username symbol has to match with username variable as we try and authenticate user
    @user = User.find_by(username: @username).try(:authenticate, @password)

    # if correct, return user
    if @user.present?
      # we attached user_id to session on user controllers
      # here we will equal it with @user.id
      session[:user_id] = @user.id

      flash[:success] = "You are now logged in"

      redirect_to root_path

    else
      render "new"
    end

  end

  def destroy
  reset_session

  flash[:success] = "You are now logged out"

  redirect_to root_path

  end

  def form_params
    params.require(:session).permit(:username, :password)
  end

end
