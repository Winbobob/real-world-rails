# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/plagiabot_importer"

describe RecentActivityController do
  let(:user) { create(:user) }

  describe '.plagiarism_report' do
    context 'when the user is logged in' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      let(:subject) { get :plagiarism_report, params: { ithenticate_id: 123 } }
      it 'fetches an iThenticate url and redirects' 

    end

    context 'when the user is logged out' do
      before do
        allow(controller).to receive(:current_user).and_return(nil)
      end

      let(:subject) { get :plagiarism_report, params: { ithenticate_id: 123 } }
      it 'redirects to login' 

    end
  end
end

