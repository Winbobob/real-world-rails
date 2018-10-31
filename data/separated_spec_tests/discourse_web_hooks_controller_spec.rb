require "rails_helper"

describe Admin::WebHooksController do

  it 'is a subclass of AdminController' 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end
    let(:web_hook) { Fabricate(:web_hook) }

    describe '#create' do
      it 'creates a webhook' 


      it 'returns error when field is not filled correctly' 

    end

    describe '#ping' do
      it 'enqueues the ping event' 

    end
  end
end

