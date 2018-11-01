require 'spec_helper'

describe Admin::EmergencyMessagesController do
  let(:message) { create(:emergency_message, message: "Test message", show: false) }
  let(:user) { create(:user, name: 'hello', admin: true, email: 'lol@biz.info') }

  before :each do
    sign_in user
    EmergencyMessage.destroy_all
  end

  it "displays the emergency message screen" 


  describe "#update" do
    let(:params) { { id: message.id, message: { name: 'Emergency message', show: true } } }

    context "that works" do
      it "does the update" 

    end

    context "a html request" do
      it "redirects to the edit path" 

    end
    context "a json request" do
      before { params[:format] = :json }

      it "responds with no content" 

    end
  end
end

