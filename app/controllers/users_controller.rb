class UsersController < ApplicationController
  before_action :my_profile, only: [:show]
  def show
    @user = User.find(params[:id])
    @events = Event.where(administrator: @user)
    @participations = Attendance.where(user: @user)
  end

private
  def my_profile
    @user = User.find(params[:id])
    unless user_signed_in? && current_user.id == @user.id
      flash[:danger] = "Connectez-vous pour accéder à cette page"
      redirect_to new_user_session_path
      
    end

  end
end
