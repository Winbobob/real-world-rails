# frozen_string_literal: true

module Admins
  class SessionsController < Devise::SessionsController
    layout "login"
    before_action :check_first_user, only: :new

    private

    def check_first_user
      redirect_to new_admin_registration_url if Admin.first.nil?
    end
  end
end
