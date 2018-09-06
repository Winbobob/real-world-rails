require "rails_helper"

RSpec.describe NegativeBalanceMailer, :type => :mailer do

  describe "shutdown_warning_email_to_user" do
    let(:user) { FactoryGirl.create(:user, notif_delivered: 1) }
    let(:mail) { NegativeBalanceMailer.shutdown_warning_email_to_user(user) }
    let(:from) { Mail::Address.new(ENV['MAILER_NOTIFICATIONS_DEFAULT_FROM']) }

    it "fills mailer queue" 


    it "renders the headers" 

    
    context "rendering" do
      before(:each) do
        send_mail :shutdown_warning_email_to_user, user
      end
      
      it "assigns variables" 

    
      it "renders the body" 

    end
  end
  
  describe "shutdown_action_email_to_user" do
    let(:user) { FactoryGirl.create(:user, notif_delivered: 10) }
    let(:mail) { NegativeBalanceMailer.shutdown_action_email_to_user(user) }
    let(:from) { Mail::Address.new(ENV['MAILER_NOTIFICATIONS_DEFAULT_FROM']) }

    it "fills mailer queue" 


    it "renders the headers" 

    
    context "rendering" do
      before(:each) do
        send_mail :shutdown_action_email_to_user, user
      end
      
      it "assigns variables" 

    
      it "renders the body" 

    end
  end
  
  describe "destroy_warning_email_to_user" do
    let(:user) { FactoryGirl.create(:user, notif_delivered: 11) }
    let(:mail) { NegativeBalanceMailer.destroy_warning_email_to_user(user) }
    let(:from) { Mail::Address.new(ENV['MAILER_NOTIFICATIONS_DEFAULT_FROM']) }

    it "fills mailer queue" 


    it "renders the headers" 

    
    context "rendering" do
      before(:each) do
        send_mail :destroy_warning_email_to_user, user
      end
      
      it "assigns variables" 

    
      it "renders the body" 

    end
  end
  
  describe "destroy_action_email_to_user" do
    let(:user) { FactoryGirl.create(:user, notif_delivered: 10) }
    let(:mail) { NegativeBalanceMailer.destroy_action_email_to_user(user) }
    let(:from) { Mail::Address.new(ENV['MAILER_NOTIFICATIONS_DEFAULT_FROM']) }

    it "fills mailer queue" 


    it "renders the headers" 

    
    context "rendering" do
      before(:each) do
        send_mail :destroy_action_email_to_user, user
      end
      
      it "assigns variables" 

    
      it "renders the body" 

    end
  end
end

