# frozen_string_literal: true

describe Workers::RemoveOldUser do
  describe 'remove_old_users is active' do
    before do
      AppConfig.settings.maintenance.remove_old_users.enable = true
    end
    
    it '#removes user whose remove_after timestamp has passed' 

    
    it '#doesnt remove user whose remove_after timestamp hasnt passed' 

    
    it '#doesnt remove user whose remove_after timestamp has passed but last_seen is recent' 

    
  end
  
  describe 'remove_old_users is inactive' do
    before do
      AppConfig.settings.maintenance.remove_old_users.enable = false
    end
    
    it '#doesnt remove user whose remove_after timestamp has passed' 

    
    it '#doesnt remove user whose remove_after timestamp hasnt passed' 

    
  end
end

