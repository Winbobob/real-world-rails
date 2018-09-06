require "rails_helper"

RSpec.describe MembershipsController, type: :controller do
  let(:user) { double("User", stripe_id: "c_1", email: "alice@example.com", devise_scope: :user) }

  describe "create" do
    before do
      expect(User).to receive(:where).with(email: "alice@example.com") do
        double(first_or_create!: user)
      end

      request.env['warden'] = double("warden", user: nil, authenticate: nil)
      expect(request.env['warden']).to receive(:set_user)
    end

    it "runs the membership creator" 


    it "forwards corporate membership information" 

  end

  describe "card" do
    let(:customer) { double(Customer) }
    let(:membership) { double(Membership) }

    it "updates the card number locally and with stripe" 

  end
end

