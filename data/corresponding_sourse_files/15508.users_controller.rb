class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:subscriptions, :welcome]

  def show
    @user = User.find(params[:id])
    @you = (current_user && @user == current_user)
    @history = @user.recent_changes(20)
  end

  def subscriptions
    @user = User.find(params[:id])
  end

  def confirm
    # Remove Devise flash
    flash.delete(:notice)
  end

  def welcome
    @policies = current_user.unwatched_policies.published.sample(3)
    flash.delete(:notice)
  end

  def stats
    @number_of_users = User.count
    @policies = Policy.all.sort {|a,b| b.watches.count <=> a.watches.count }
  end
end
