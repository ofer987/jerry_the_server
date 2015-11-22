class SessionsController < ApplicationController
  def new
    redirect_to '/' and return if session[:user_id].present?
  end

  def create
    redirect_to action: :new and return if session[:user_id].present?

    user = find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to user
    else
      redirect_to action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_type] = nil

    redirect_to action: :new
  end

  private

  def find_by_email(email)
    User.where(email: email).first
  end
end
