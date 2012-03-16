class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    member = Member.find_by_name(params[:name])
    if member and member.authenticate(params[:password])
      session[:member_id] = member.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to movie_url, notice: "Logged out"
  end
end
