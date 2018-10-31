require 'rails_helper'
require 'rack/mock'

describe AuthCookieStrategy do

  let(:strategy) { described_class.new(env) }
  let(:env) { Rack::MockRequest.env_for('', 'HTTP_COOKIE' => cookies) }

  describe '#valid?' do
    subject { strategy.valid? }

    context "when auth_token is present in cookies" do
      let(:cookies) { 'auth_token=abc' }

      it { should be(true) }
    end

    context "when auth_token isn't present in cookies" do
      let(:cookies) { '' }

      it { should be(false) }
    end
  end

  describe '#authenticate!' do
    subject { strategy.authenticate! }

    let(:cookies) { "auth_token=#{auth_token}" }
    let(:auth_token) { "yadayadayada" }

    before do
      allow(User).to receive(:for_auth_token).with(auth_token) { user }
    end

    context "when user exists for given token" do
      let(:user) { User.new }

      it "halts the chain" 


      it "sets the proper user" 

    end

    context "when user doesn't exist for given token" do
      let(:user) { nil }

      it "doesn't halt the chain" 


      it "doesn't set user" 

    end
  end

end

