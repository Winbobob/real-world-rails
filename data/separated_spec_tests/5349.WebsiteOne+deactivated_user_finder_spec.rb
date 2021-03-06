require 'spec_helper'

describe 'DeactivatedUserFinderConcern' do
  before :all do
    class FakeController < ActionController::Base
      include DeactivatedUserFinder
    end
    @fake_controller = FakeController.new
  end
  
  describe '#deactivated_user_with_email' do
    before do
      @deactivated_user = FactoryBot.create(:user, deleted_at: DateTime.new(2000, 1, 1), email: 'random@random.com')
      @user = FactoryBot.create(:user, email: 'example@example.com')
    end
    
    it "should return deactivated user when email is deactivated_user's email" 

    
    it "should return nil when email is user's email" 

  end

  after :all do
    Object.send(:remove_const, :FakeController)
  end
end

