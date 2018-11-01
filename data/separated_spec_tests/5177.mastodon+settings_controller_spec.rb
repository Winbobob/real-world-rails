# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SettingsController, type: :controller do
  render_views

  describe 'When signed in as an admin' do
    before do
      sign_in Fabricate(:user, admin: true), scope: :user
    end

    describe 'GET #edit' do
      it 'returns http success' 

    end

    describe 'PUT #update' do
      describe 'for a record that doesnt exist' do
        around do |example|
          before = Setting.site_extended_description
          Setting.site_extended_description = nil
          example.run
          Setting.site_extended_description = before
          Setting.new_setting_key = nil
        end

        it 'cannot create a setting value for a non-admin key' 


        it 'creates a settings value that didnt exist before for eligible key' 

      end

      context do
        around do |example|
          site_title = Setting.site_title
          example.run
          Setting.site_title = site_title
        end

        it 'updates a settings value' 

      end

      context do
        around do |example|
          open_registrations = Setting.open_registrations
          example.run
          Setting.open_registrations = open_registrations
        end

        it 'typecasts open_registrations to boolean' 

      end
    end
  end
end

