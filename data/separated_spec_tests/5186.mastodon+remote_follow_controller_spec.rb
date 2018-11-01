# frozen_string_literal: true

require 'rails_helper'

describe RemoteFollowController do
  render_views

  describe '#new' do
    it 'returns success when session is empty' 


    it 'populates the remote follow with session data when session exists' 

  end

  describe '#create' do
    before do
      @account = Fabricate(:account, username: 'test_user')
    end

    context 'with a valid acct' do
      context 'when webfinger values are wrong' do
        it 'renders new when redirect url is nil' 


        it 'renders new when template is nil' 

      end

      context 'when webfinger values are good' do
        before do
          link_with_template = double(template: 'http://example.com/follow_me?acct={uri}')
          resource_with_link = double(link: link_with_template)
          allow(Goldfinger).to receive(:finger).with('acct:user@example.com').and_return(resource_with_link)
          post :create, params: { account_username: @account.to_param, remote_follow: { acct: 'user@example.com' } }
        end

        it 'saves the session' 


        it 'redirects to the remote location' 

      end
    end

    context 'with an invalid acct' do
      it 'renders new when acct is missing' 


      it 'renders new with error when goldfinger fails' 


      it 'renders new when occur HTTP::ConnectionError' 

    end
  end

  describe 'with a suspended account' do
    before do
      @account = Fabricate(:account, suspended: true)
    end

    it 'returns 410 gone on GET to #new' 


    it 'returns 410 gone on POST to #create' 

  end
end

