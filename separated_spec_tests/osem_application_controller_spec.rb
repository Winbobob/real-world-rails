# frozen_string_literal: true

require 'spec_helper'

describe ApplicationController, type: :controller do
  let(:conference) { create(:conference) }

  describe 'user is signed in' do

    describe 'as admin' do
      let(:admin) { create(:admin) }
      before { sign_in(admin) }

      it 'redirects to the admin homepage' 

    end

    describe 'as regular user' do
      let(:user) { create(:user) }
      before { sign_in(user) }

      context 'with no return_to value in the session' do
        it 'redirects to the root_path' 

      end

      context 'with a specific return_to value provided in the session' do
        it 'redirects to the conferences_path' 

      end
    end

  end

end

describe ApplicationController, type: :request do
  let(:conference) { create(:conference) }

  describe 'Skylight link' do

    around do |example|
      original_value = ENV['SKYLIGHT_PUBLIC_DASHBOARD_URL']
      example.run
      ENV['SKYLIGHT_PUBLIC_DASHBOARD_URL'] = original_value
    end

    context 'when SKYLIGHT_PUBLIC_DASHBOARD_URL is set' do
      before do
        ENV['SKYLIGHT_PUBLIC_DASHBOARD_URL'] = 'https://oss.skylight.io/app/applications/my-osem'
      end

      it 'should include a link to view performance data' 

    end

    context 'when SKYLIGHT_PUBLIC_DASHBOARD_URL is not set' do
      before do
        ENV['SKYLIGHT_PUBLIC_DASHBOARD_URL'] = nil
      end

      it 'should not include a link to view performance data' 

    end

  end

end

