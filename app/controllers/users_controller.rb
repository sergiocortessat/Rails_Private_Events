class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    # @upcoming_events = current_user.attended_events.upcoming
    # @past_events = current_user.attended_events.past
  end
end
