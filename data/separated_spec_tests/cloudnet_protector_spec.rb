require 'rails_helper'
include NegativeBalanceProtection
include NegativeBalanceProtection::ActionStrategies
include NegativeBalanceProtection::Actions

describe Protector do
  let(:user) { FactoryGirl.create(:user, notif_delivered: 10) }
  let(:strategy) {UserConstraintsAdminConfirm}
  let(:protector) {Protector.new(user, strategy)}
  
  let(:strategy_double) {double('Strategy', action_list: [:action1, :action2])}
  let(:strategy_double2) {double('Strategy2', action_list: [:action1, :undefined_action])}
  let(:strategy_double3) {double('Strategy3', action_list: [:action1, :increment_notifications_delivered])}
  let(:strategy_double4) {double('Strategy4', action_list: [:action1, :shutdown_all_servers ])}
  let(:strategy_double5) {double('Strategy5', action_list: [:action1, :clear_notifications_delivered ])}
  
  it "should initialize properly" 


  context "#counter_actions" do
    let(:action) {double('Action1')}
    let(:action_class_double) {double('ActionClass')}
    
    before(:each) do
      stub_const("NegativeBalanceProtection::Actions::Action1", action_class_double)
      stub_const("NegativeBalanceProtection::Actions::Action2", action_class_double)
    end
    
    it "should perform actions" 

  
    it "should not perform undefined actions" 

    
    it "should increment delivered notifications" 

    
    it "should refresh user's servers after shutdown" 

    
    it "should clear all notifications for a user" 

  end
end

