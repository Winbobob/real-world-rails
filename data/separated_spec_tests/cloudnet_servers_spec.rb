require 'rails_helper'

describe API do
  let(:api) {'http://api.localhost.com'}
  let(:user) { FactoryGirl.create :user, confirmed_at: Date.today }
  let(:api_key) { FactoryGirl.create :api_key, user: user}
  let(:encoded) { Base64.encode64("#{user.email}:#{api_key.key}") }
  let(:good_header) { {"Authorization": "Basic #{encoded}", "Accept-Version": "v1"} }
  let!(:server_list) { FactoryGirl.create_list :server, 3, user: user }
  let(:server_id) { server_list[0].id }
  describe 'Servers methods' do
    it_behaves_like "api authentication", "servers/1"

    it 'returns all servers for a current user' 


    context 'GET /server/:id' do
      it 'returns a server if a user is authorized' 


      it 'returns "not found" if a user is not authorized' 

    end

    context 'DELETE /server/:id' do
      it 'destroys a server if a user is authorized' 


      it 'returns "not found" if a user is not authorized' 

    end

    context 'POST /server' do
      it 'creates a server if a user is authorized' 


      it 'returns error if no template_id in params' 


      it 'returns error if non existing template_id in params' 


      it 'returns error if out of scope cpus in params' 


      it 'returns error if out of scope memory in params' 


      it 'returns error if out of scope disk size in params' 

    end

    context 'PUT /server/:id' do
      before :each do
        expect_any_instance_of(ServerWizard).to receive(:cost_for_hours).and_return(0)
        expect_any_instance_of(ServerWizard).to receive(:calculate_remaining_cost).and_return(0)
        expect_any_instance_of(ServerWizard).to receive(:request_server_edit).and_return(true)
        @server = Server.find(server_id)
        @account = user.account
        expect(@account.invoices).to be_empty
        expect(@account.credit_notes).to be_empty
      end

      it 'changes the number of cpus and generates invoice and credit_note' 


      it 'changes memory and generates invoice and credit_note' 

    end
  end
end

