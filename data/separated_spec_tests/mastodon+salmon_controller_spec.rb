require 'rails_helper'

RSpec.describe Api::SalmonController, type: :controller do
  render_views

  let(:account) { Fabricate(:user, account: Fabricate(:account, username: 'catsrgr8')).account }

  before do
    stub_request(:get, "https://quitter.no/.well-known/host-meta").to_return(request_fixture('.host-meta.txt'))
    stub_request(:get, "https://quitter.no/.well-known/webfinger?resource=acct:gargron@quitter.no").to_return(request_fixture('webfinger.txt'))
    stub_request(:get, "https://quitter.no/api/statuses/user_timeline/7477.atom").to_return(request_fixture('feed.txt'))
    stub_request(:get, "https://quitter.no/avatar/7477-300-20160211190340.png").to_return(request_fixture('avatar.txt'))
  end

  describe 'POST #update' do
    context 'with valid post data' do
      before do
        post :update, params: { id: account.id }, body: File.read(Rails.root.join('spec', 'fixtures', 'salmon', 'mention.xml'))
      end

      it 'contains XML in the request body' 


      it 'returns http success' 


      it 'creates remote account' 


      it 'creates status' 


      it 'creates mention for target account' 

    end

    context 'with empty post data' do
      before do
        post :update, params: { id: account.id }, body: ''
      end

      it 'returns http client error' 

    end

    context 'with invalid post data' do
      before do
        service = double(call: false)
        allow(VerifySalmonService).to receive(:new).and_return(service)

        post :update, params: { id: account.id }, body: File.read(Rails.root.join('spec', 'fixtures', 'salmon', 'mention.xml'))
      end

      it 'returns http client error' 

    end
  end
end

