class LocalauthController < ApplicationController
  def index
    redirect_to :action => 'login'
  end

  def login
  end

end
