require 'rails_helper'


describe TokenHandler do
  subject { TokenHandler }

  let(:controller) do
    double(:controller).tap do |c|
      allow(c).to receive(:redirect_to)
      allow(c).to receive(:login)
      allow(c).to receive(:current_user)
    end
  end

  context "with an active token" do
    let(:token) { create(:token) }

    it 'can handle a token' 

  end

  context "with an inactive token" do
    let(:token) { create(:token, active: false) }

    it 'can handle a token' 

  end

  context "with an unknown token handler" do
    let(:token) do
      create(:token).tap do |t|
        allow_any_instance_of(Token).to receive(:token_type).and_return("foobar")
      end
    end

    it 'can handle a token' 

  end
end

