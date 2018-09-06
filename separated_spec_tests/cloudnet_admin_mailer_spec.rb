require "rails_helper"

RSpec.describe AdminMailer, :type => :mailer do
  let(:user) { FactoryGirl.create(:user, notif_delivered: 11) }
  let(:from) { Mail::Address.new(ENV['MAILER_ADMIN_DEFAULT_FROM']) }

  describe "shutdown_action" do
    let(:mail) { AdminMailer.shutdown_action(user) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        send_mail :shutdown_action, user
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end

  describe "destroy_warning" do
    let(:mail) { AdminMailer.destroy_warning(user) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        send_mail :destroy_warning, user
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end

  describe "request_for_server_destroy" do
    let(:mail) { AdminMailer.request_for_server_destroy(user) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        send_mail :request_for_server_destroy, user
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end

  describe "destroy_action" do
    let(:mail) { AdminMailer.destroy_action(user) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        send_mail :destroy_action, user
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end

  describe 'notify faulty server' do
    let(:server) { FactoryGirl.create(:server) }
    let(:mail) { AdminMailer.notify_faulty_server(server, true, true) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        send_mail :notify_faulty_server, server, true, true
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end

  describe 'notify automatic invoice' do
    let(:server) { FactoryGirl.create(:server) }
    let(:old_server_specs) { Server.new server.as_json }
    let(:mail) { AdminMailer.notify_automatic_invoice(server, old_server_specs) }

    it "fills mailer queue" 


    it "renders the headers" 


    context "rendering" do
      before(:each) do
        old_server_specs.cpus = server.cpus + 1
        old_server_specs.memory = server.memory + 100
        old_server_specs.disk_size = server.disk_size + 10
        send_mail :notify_automatic_invoice, server, old_server_specs
      end

      it "assigns variables" 


      it "renders the body" 

    end
  end
end

