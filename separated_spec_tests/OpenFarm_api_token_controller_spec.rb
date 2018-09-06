require 'spec_helper'

describe Api::V1::TokensController, type: :controller do

  include ApiHelpers

  let(:user) { FactoryGirl.create(:confirmed_user) }

  it 'creates a token' 


  it 'handles bad passwords' 


  it 'handles malformed emails' 


  it 'handles incorrect emails' 


  it 'deletes a token' 


  it 'handles attempts to destroy nil tokens' 

end

