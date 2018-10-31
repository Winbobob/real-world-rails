# frozen_string_literal: true

describe EmailInviter do
  before do
    @user = double(invitation_code: "coolcodebro", present?: true, email: "foo@bar.com")
    @emails = "mbs333@gmail.com, foo1@bar.com maxwell@dude.com"
  end

  it "has a list of emails" 


  it 'should parse three emails' 


  it 'has an inviter' 


  describe '#emails' do
    it 'rejects the inviter email if present' 

  end

  describe 'language' do
    it 'defaults to english' 


    it 'should symbolize keys' 


    it 'listens to the langauge option' 

  end

  describe '#invitation_code' do
    it 'delegates to the user' 

  end
end

