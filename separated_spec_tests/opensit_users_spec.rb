require 'spec_helper'

describe 'Users' do

  subject { page }
  before do
    @buddha = create :user, username: "buddha"
  end

  it 'should register a new user' 


  it 'blocks blacklisted emails' 


  it 'does not block similar patterns' 


  describe 'registered users' do

    it 'should be able to log in' 


  end

  describe 'username urls' do
    context 'existing users' do
      it 'with /u' 


      it 'case insensitive' 

    end

    it 'should return 404 for non-existent users' 

  end

end

