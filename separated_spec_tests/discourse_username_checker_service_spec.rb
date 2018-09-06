require 'rails_helper'

describe UsernameCheckerService do

  describe 'check_username' do

    before do
      @service = UsernameCheckerService.new
      @nil_email = nil
      @email = 'vincentvega@example.com'
    end

    context 'Username invalid' do
      it 'rejects too short usernames' 

      it 'rejects too long usernames' 


      it 'rejects usernames with invalid characters' 


      it 'rejects usernames that do not start with an alphanumeric character' 

    end

    it 'username not available locally' 


    it 'username available locally' 

  end

end
