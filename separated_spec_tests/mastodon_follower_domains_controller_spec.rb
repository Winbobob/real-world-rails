require 'rails_helper'

describe Settings::FollowerDomainsController do
  render_views

  let(:user) { Fabricate(:user) }

  shared_examples 'authenticate user' do
    it 'redirects when not signed in' 

  end

  describe 'GET #show' do
    subject { get :show, params: { page: 2 } }

    it 'assigns @account' 


    it 'assigns @domains' 


    it 'returns http success' 


    include_examples 'authenticate user'
  end

  describe 'PATCH #update' do
    let(:poopfeast) { Fabricate(:account, username: 'poopfeast', domain: 'example.com', salmon_url: 'http://example.com/salmon') }

    before do
      stub_request(:post, 'http://example.com/salmon').to_return(status: 200)
    end

    shared_examples 'redirects back to followers page' do |notice|
      it 'redirects back to followers page' 

    end

    context 'when select parameter is not provided' do
      subject { patch :update }
      include_examples 'redirects back to followers page', 'In the process of soft-blocking followers from 0 domains...'
    end

    context 'when select parameter is provided' do
      subject { patch :update, params: { select: ['example.com'] } }

      it 'soft-blocks followers from selected domains' 


      include_examples 'authenticate user'
      include_examples 'redirects back to followers page', 'In the process of soft-blocking followers from one domain...'
    end
  end
end

