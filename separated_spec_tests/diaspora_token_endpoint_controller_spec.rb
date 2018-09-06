# frozen_string_literal: true

describe Api::OpenidConnect::TokenEndpointController, type: :controller, suppress_csrf_verification: :none do
  let(:auth) { FactoryGirl.create(:auth_with_read) }

  describe "#create" do
    it "returns 200 on success" 

  end
end

