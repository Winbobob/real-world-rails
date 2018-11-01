# frozen_string_literal: true

require 'rails_helper'

describe Api::Web::SettingsController do
  render_views

  let!(:user) { Fabricate(:user) }

  describe 'PATCH #update' do
    it 'redirects to about page' 


    def user_web_setting
      Web::Setting.where(user: user).first
    end
  end
end

