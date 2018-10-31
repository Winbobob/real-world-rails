require 'rails_helper'

describe ServerTasks do
  before :each do
    allow_any_instance_of(Server).to receive(:supports_multiple_ips?).and_return(false)
  end

  it 'sets the correct state when refreshing the server' 


  context 'update billing when params changed' do
    let(:server) { FactoryGirl.create :server }
    let(:account) { server.user.account }
    let(:task) { ServerTasks.new }
    let(:info) { { 'ip_addresses' => [{ 'ip_address' => { 'address' => '192.168.1.1' } }],
              'locked' => false, 'booted' => true, 'cpus' => server.cpus,
              'memory' => server.memory, 'total_disk_size' => server.disk_size } }
    before :each do
      allow_any_instance_of(Squall::VirtualMachine).to receive(:show).and_return(info)
      FactoryGirl.create :payment_receipt, account: account
    end

    context 'refresh server with billing change' do
      before :each do
        expect(AdminMailer).to receive(:notify_automatic_invoice).with(server, instance_of(Server)).
          and_return(double(deliver_now: true))
      end

      it 'creates credit_note and invoice if memory changed' 


      it 'creates credit_note and invoice if cpu changed' 


      it 'creates credit_note and invoice if disk_size changed' 


      it 'creates credit_note and invoice if server in edit but force update' 

    end

    context 'refresh server with no billing change' do
      before :each do
        expect(AdminMailer).not_to receive(:notify_automatic_invoice)
      end

      it 'does not create credit_note and invoice if :monitoring task' 


      it 'does not create credit_note and invoice if server in edit' 

    end
  end

  xcontext 'against real existing server', :vcr do
    include_context :with_server

    it 'grabs the CPU usages for the server' 


    it 'grabs the Network usages for the server' 


    it 'allows refreshed transactions/events of the server' 


    it 'allows rebooting of the server' 


    it 'allows shutdown and startup of the server' 


    it 'allows console of a server' 


    it 'allows destroy of a server' 


    describe 'Editing a server' do
      it 'should change the disk size of an existing server' 


      it 'should change the resources of an existing server' 

    end
  end
end

