require 'spec_helper'

describe Spree::UserMailer do
  let(:user) { build(:user) }

  after do
    ActionMailer::Base.deliveries.clear
  end

  before do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    Spree::MailMethod.create!(environment: 'test')
  end

  it "sends an email when given a user" 


  # adapted from https://github.com/spree/spree_auth_devise/blob/70737af/spec/mailers/user_mailer_spec.rb
  describe '#reset_password_instructions' do
    describe 'message contents' do
      before do
        @message = described_class.reset_password_instructions(user)
      end

      context 'subject includes' do
        it 'translated devise instructions' 


        it 'Spree site name' 

      end

      context 'body includes' do
        it 'password reset url' 

      end
    end

    describe 'legacy support for User object' do
      it 'sends an email' 

    end
  end
end

