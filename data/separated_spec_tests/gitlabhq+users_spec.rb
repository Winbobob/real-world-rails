# frozen_string_literal: true

module QA
  context 'Manage' do
    describe 'Users API' do
      before(:context) do
        @api_client = Runtime::API::Client.new(:gitlab)
      end

      let(:request) { Runtime::API::Request.new(@api_client, '/users') }

      it 'GET /users' 


      it 'GET /users/:username with a valid username' 


      it 'GET /users/:username with an invalid username' 

    end
  end
end

