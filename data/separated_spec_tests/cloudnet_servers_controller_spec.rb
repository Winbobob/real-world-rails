require 'rails_helper'

describe ServersController do
  describe 'as a signed in user who is active' do
    before(:each) { sign_in_onapp_user }
    let(:server) { FactoryGirl.create(:server, user: @current_user) }

    describe 'going to the index page' do
      it 'should render the dashboard index page' 


      it 'should assign @servers to display for the current user' 

    end

    describe 'going to the server show page' do
      it 'should render the show template' 


      it 'should show information about the server' 

    end

    describe 'events' do
      it 'should render the events template if json' 

    end

    describe 'server actions' do
      before(:each) do
        @server_tasks = double('ServerTasks', perform: true)
        allow(ServerTasks).to receive(:new).and_return(@server_tasks)
        allow(MonitorServer).to receive(:perform_in).and_return(true)
        request.env['HTTP_REFERER'] = servers_path
        Sidekiq::Worker.clear_all
      end

      it 'should allow rebooting of a server' 


      it 'should show an error if reboot schedule failed' 


      it 'should allow shutdown of a server' 


      it 'should show an error if shutdown schedule failed' 


      it 'should allow startup of a server' 


      it 'should show an error if startup schedule failed' 

      
      it 'should rebuild network of a server' 

      
      it 'should reset password of a server' 


      describe 'editing server' do
        context 'before editing' do
          it 'should preset the server wizard to step 2' 

        end

        context 'submitting an edit' do
          before :each do
            @edit_server_task = double('EditServerTask', edit_server: true)
            allow(EditServerTask).to receive_messages(new: @edit_server_task)
            
            @card = FactoryGirl.create :billing_card, account: @current_user.account
            @payments = double('Payments', auth_charge: { charge_id: 12_345 }, capture_charge: { charge_id: 12_345 })
            @server = FactoryGirl.create(
              :server,
              user: @current_user,
              cpus: 1,
              memory: 1024,
              disk_size: 20
            )
            
            @old_server_params = {"cpus"=>@server.cpus, 
                                  "memory"=>@server.memory,
                                  "name"=>@server.name}
            # We don't actually destroy the old server to make the edit, we just need 2 server
            # entities so that we can generate an invoice for both in order to figure out the price
            # difference
            @new_server = FactoryGirl.create(
              :server,
              user: @current_user,
              cpus: 3,
              memory: 1512,
              disk_size: 20
            )
            
            @payment_receipts = FactoryGirl.create_list(:payment_receipt, 2, account: @current_user.account)
                                 
            allow(Payments).to receive_messages(new: @payments)
            allow(MonitorServer).to receive(:perform_async).and_return(true)
            Sidekiq::Testing.inline!
          end
          
          after(:each) do
            Sidekiq::Testing.fake!
          end

          it 'should trigger the edit server task' 


          xit 'should not charge for a server that costs less' do
          end

          it 'should handle errors if updating resources fails' 

        end
      end
    end

    describe 'destroying server' do
      it 'should attempt to destroy the server' 


      it 'should return an error to the user if destroy failed' 

    end
  end
end

