require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::ActionStrategies

describe UserConstraintsAdminConfirm do
  let(:user) { FactoryGirl.create(:user) }
  let!(:server) {FactoryGirl.create(:server, user: user)}
  let(:strategy) {UserConstraintsAdminConfirm}
  let(:time_passed) {Time.now - (BaseStrategy::MIN_HOURS_BETWEEN_EMAILS).hours}
  let(:time_not_passed) {Time.now - (BaseStrategy::MIN_HOURS_BETWEEN_EMAILS - 1).hours}
  
  let(:not_sent_request) {Actions::RequestForServerDestroyEmailToAdmin::REQUEST_NOT_SENT}
  let(:sent_request_nc) {Actions::RequestForServerDestroyEmailToAdmin::REQUEST_SENT_NOT_CONFIRMED}
  let(:sent_request_c) {Actions::RequestForServerDestroyEmailToAdmin::REQUEST_SENT_CONFIRMED}
  
  context "#before_shutdown_warnings?" do
    it "should be true if profile defined number of emails not sent and time passed" 

    
    it "should be true if no emails sent" 

    
    it "should be false if profile defined number of emails not sent but no time passed" 

    
    it "should be false if profile defined number of shutdown emails sent or more" 

  end
  
  context "#perform_shutdown?" do
    it "should be false if no emails sent" 

    
    it "should be false if profile defined number of emails not sent and time passed" 

    
    it "should be false if profile defined number of emails sent but no time passed" 

    
    it "should be false if more than profile defined number of emails sent and time passed" 

    
    it "should be true if profile defined number of emails sent and time passed" 

  end
  
  context "#before_destroy_warnings?" do
    it "should be false if profile defined number of 
        emails for shutdown not sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_shutdown - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).before_destroy_warnings?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy not sent, and more emails than for shutdown sent but no time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy - 1,
                last_notif_email_sent: time_not_passed)
      expect(strategy.new(user1).before_destroy_warnings?).to be_falsy
    end

    it "should be false if profile defined number of emails sent for destroy or more" 

    
    it "should be true if profile defined number of emails 
        for destroy not sent, and more emails than for shutdown sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).before_destroy_warnings?).to be_truthy
    end
  end
  
  context "#admin_acknowledge_for_destroy?" do
    it "should be false if profile defined number of 
        emails for shutdown not sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_shutdown - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).admin_acknowledge_for_destroy?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy not sent, and more emails than for shutdown sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).admin_acknowledge_for_destroy?).to be_falsy
    end

    it "should be false if profile defined number of emails 
        for destroy sent or more, request for admin not sent but no time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: not_sent_request,
                last_notif_email_sent: time_not_passed)
      user2 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy + 1,
                admin_destroy_request: not_sent_request,
                last_notif_email_sent: time_not_passed)
      expect(strategy.new(user1).admin_acknowledge_for_destroy?).to be_falsy
      expect(strategy.new(user2).admin_acknowledge_for_destroy?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy sent or more, request for admin sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: sent_request_nc,
                last_notif_email_sent: time_passed)
      user2 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy + 1,
                admin_destroy_request: sent_request_c,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).admin_acknowledge_for_destroy?).to be_falsy
      expect(strategy.new(user2).admin_acknowledge_for_destroy?).to be_falsy
    end
    
    it "should be true if profile defined number of emails 
        for destroy sent or more, request for admin not sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: not_sent_request,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).admin_acknowledge_for_destroy?).to be_truthy
    end
  end
  
  context "#perform_destroy?" do
    it "should be false if profile defined number of 
        emails for shutdown not sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_shutdown - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).perform_destroy?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy not sent, and more emails than for shutdown sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy - 1,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).perform_destroy?).to be_falsy
    end

    it "should be false if profile defined number of emails 
        for destroy sent or more, request for admin not sent and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: not_sent_request,
                last_notif_email_sent: time_passed)
      user2 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy + 1,
                admin_destroy_request: not_sent_request,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).perform_destroy?).to be_falsy
      expect(strategy.new(user2).perform_destroy?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy sent or more, request for admin not confirmed and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: sent_request_nc,
                last_notif_email_sent: time_passed)
      user2 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy + 1,
                admin_destroy_request: sent_request_nc,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).perform_destroy?).to be_falsy
      expect(strategy.new(user2).perform_destroy?).to be_falsy
    end
    
    it "should be false if profile defined number of emails 
        for destroy sent or more, request for admin confirmed but no time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: sent_request_c,
                last_notif_email_sent: time_not_passed)
      expect(strategy.new(user1).perform_destroy?).to be_falsy
    end
    
    it "should be true if profile defined number of emails 
        for destroy sent or more, request for admin confirmed and time passed" do
      user1 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy,
                admin_destroy_request: sent_request_c,
                last_notif_email_sent: time_passed)
      user2 = FactoryGirl.create(:user, notif_delivered: user.notif_before_destroy + 1,
                admin_destroy_request: sent_request_c,
                last_notif_email_sent: time_passed)
      expect(strategy.new(user1).perform_destroy?).to be_truthy
      expect(strategy.new(user2).perform_destroy?).to be_truthy
    end
  end
  
  context "#action_list" do
    let(:no_servers_actions) {[
          :clear_notifications_delivered
        ]}
        
    let(:before_shutdown_actions) {[
          :shutdown_warning_email_to_user,
          :increment_notifications_delivered
        ]}
        
    let(:shutdown_actions) {[
          :shutdown_all_servers, 
          :shutdown_action_email_to_user, 
          :shutdown_action_email_to_admin,
          :increment_notifications_delivered
        ]}
        
    let(:before_destroy_actions) {[
          :shutdown_all_servers, 
          :destroy_warning_email_to_user, 
          :destroy_warning_2days_email_to_admin,
          :increment_notifications_delivered
        ]}
        
    let(:admin_acknowledge_actions) {[ :request_for_server_destroy_email_to_admin]}
    
    let(:destroy_servers_actions) {[
          :destroy_all_servers_confirmed,
          :destroy_action_email_to_user,
          :destroy_action_email_to_admin,
          :clear_notifications_delivered
        ]}
        
    before(:each) do
      allow_any_instance_of(Account).
          to receive(:remaining_invoice_balance).and_return(200_000)
    end
    
    it "should return actions for no servers" 

    
    it "should return actions for before_shutdown_actions" 

    
    it "should return actions for perform_shutdown" 

    
    it "should return actions for before_destroy_actions" 

    
    it "should return actions for admin_acknowledge_actions" 

    
    it "should return actions for destroy_servers_actions" 

  end
end

