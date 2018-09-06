# frozen_string_literal: true

describe Workers::QueueUsersForRemoval do
  describe 'remove_old_users is active' do
    before do
      AppConfig.settings.maintenance.remove_old_users.enable = true
      AppConfig.settings.maintenance.remove_old_users.limit_removals_to_per_day = 1
      ActionMailer::Base.deliveries = nil
      Timecop.freeze
    end
    
    it '#does not queue user that is not inactive' 

    
    it '#queues user that is inactive' 

    
    it '#queues user that is inactive and has not logged in' 

    
    it '#does not queue user that is not inactive and has not logged in' 

    
    it '#does not queue user that has already been flagged for removal' 


    it '#does not queue more warnings than has been configured as limit' 

    
    after do
      Timecop.return
    end 
  end
  
  describe 'remove_old_users is inactive' do
    before do
      AppConfig.settings.maintenance.remove_old_users.enable = false
      ActionMailer::Base.deliveries = nil
    end
    
    it '#does not queue user that is not inactive' 

    
    it '#does not queue user that is inactive' 

    
  end
end

