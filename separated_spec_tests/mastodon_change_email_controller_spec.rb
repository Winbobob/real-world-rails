require 'rails_helper'

RSpec.describe Admin::ChangeEmailsController, type: :controller do
  render_views

  let(:admin) { Fabricate(:user, admin: true) }

  before do
    sign_in admin
  end

  describe "GET #show" do
    it "returns http success" 

  end

  describe "GET #update" do
    before do
      allow(UserMailer).to receive(:confirmation_instructions).and_return(double('email', deliver_later: nil))
    end

    it "returns http success" 

  end
end

