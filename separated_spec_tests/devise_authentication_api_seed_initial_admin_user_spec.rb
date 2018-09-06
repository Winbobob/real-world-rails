require 'spec_helper'

describe 'seed initial admin user' do

  context 'after app initialization' do
    before do
      INITIALIZE_ADMIN_USER.call # see config.after_initialize in application.rb
    end

    it 'has created admin user' 


    it 'has set is_admin_user to true' 

  end

end

