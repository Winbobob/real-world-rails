require "rails_helper"

describe Admin::WebHooksController do

  it 'is a subclass of AdminController' 


  context 'while logged in as an admin' do
    let(:web_hook) { Fabricate(:web_hook) }
    let(:admin) { Fabricate(:admin) }

    before do
      sign_in(admin)
    end

    describe '#create' do
      it 'creates a webhook' 


      it 'returns error when field is not filled correctly' 

    end

    describe '#ping' do
      it 'enqueues the ping event' 

    end
  end
end

