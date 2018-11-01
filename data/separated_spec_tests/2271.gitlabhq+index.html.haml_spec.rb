# frozen_string_literal: true

require 'rails_helper'

describe 'help/index' do
  include StubVersion

  describe 'version information' do
    before do
      stub_helpers
    end

    it 'is hidden from guests' 


    context 'when logged in' do
      before do
        stub_user
      end

      it 'shows a link to the tag to users' 


      it 'shows a link to the commit for pre-releases' 

    end
  end

  describe 'instance configuration link' do
    it 'is visible to guests' 

  end

  def stub_user(user = double)
    allow(view).to receive(:user_signed_in?).and_return(user)
  end

  def stub_helpers
    allow(view).to receive(:markdown).and_return('')
    allow(view).to receive(:version_status_badge).and_return('')
    allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
  end
end

