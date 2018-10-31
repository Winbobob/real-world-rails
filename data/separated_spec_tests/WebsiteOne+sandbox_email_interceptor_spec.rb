require 'spec_helper'

describe SandboxEmailInterceptor do
    describe '#delivering_email' do
       before(:each) do
        @user1 = FactoryBot.create(:user)
        @project = FactoryBot.create(:project, user: @user1)
        @user2 = FactoryBot.create(:user)
       end
       it 'delivers all emails to user when intercept_emails is set to true' 

    end
end

