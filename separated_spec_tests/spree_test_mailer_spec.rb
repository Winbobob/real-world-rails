require 'spec_helper'
require 'email_spec'

describe Spree::TestMailer, type: :mailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  before { create(:store) }

  let(:user) { create(:user) }

  context ':from not set explicitly' do
    it 'falls back to spree config' 

  end

  it 'confirm_email accepts a user id as an alternative to a User object' 


  context 'action mailer host' do
    it 'falls back to spree store url' 


    it 'uses developer set host' 

  end
end

