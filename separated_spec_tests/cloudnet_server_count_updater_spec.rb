require 'rails_helper'

describe UserAnalytics::ServerCountUpdater do
  
  context 'user with VM data count' do
    before(:all) do
      @test_date = Time.now + 20.days
      @user = FactoryGirl.create(:user)
      @user2 = FactoryGirl.create(:user)
      8.times do |i|
        FactoryGirl.create(:user_server_count, 
                           date: (@test_date - i.days), 
                           user: @user, servers_count: rand(5))
      end
    
      3.times do |i|
        FactoryGirl.create(:user_server_count, 
                           date: (@test_date - i.days), 
                           user: @user2, servers_count: rand(5))
      end
    end
  
    subject{ UserAnalytics::ServerCountUpdater.new(@user) }
  
    after(:each) { Timecop.return }
    after(:all) { User.destroy_all }
  
    it 'calculates start update date' 

  
    it 'creates proper range of update days' 

  
    it "counts user's records" 

  
    it 'updates user data up to current date' 

  
    it 'keeps declared amount of data' 

  end
  
  describe 'user with no VM data count' do
    context 'recent user' do
      let(:user) { FactoryGirl.create(:user, created_at: 1.day.ago) }
      subject{ UserAnalytics::ServerCountUpdater.new(user) }
    
      it 'initialize data properly' 

    
      it 'counts servers lasting proper time' 

    end
    
    context 'long lasting user' do
      let(:user) { FactoryGirl.create(:user, created_at: 100.days.ago) }
      subject{ UserAnalytics::ServerCountUpdater.new(user) }
      
      before(:each) do
        @data_stored_count = 5
        stub_const("UserAnalytics::ServerCountUpdater::MAX_DATAPOINTS_FOR_EXISTING_USER", @data_stored_count)
      end
      
      it 'sets date range properly' 

      
      it 'initialize data properly' 

    end
  end
  
  describe 'bulk update' do
    subject{ UserAnalytics::ServerCountUpdater }
    
    it 'prepares array of values' 

    
    it 'prepares sql statement' 

    
    it 'saves data in one sql statement' 

    
    it 'doesnt allow for same record inserted twice' 

    
    context 'removal old data' do
      let(:user1) { FactoryGirl.create(:user) }
      let(:user2) { FactoryGirl.create(:user) }
      let(:user3) { FactoryGirl.create(:user) }
      
      def create_server_count_data(user, amount)
        today = Date.today
        amount.times do |i|
          FactoryGirl.create(:user_server_count, 
                             date: (today - i.days), 
                             user: user, servers_count: rand(5))
        end
      end
      
      def last_server_count_date(user)
        user.server_count_history.order(date: :desc).limit(1).take.date
      end
      
      before(:each) do
        @data_stored_count = 5
        stub_const("UserAnalytics::ServerCountUpdater::MAX_DATAPOINTS_STORED_PER_USER", @data_stored_count)
      
        create_server_count_data(user1, @data_stored_count + 5)
        create_server_count_data(user2, @data_stored_count + 10)
        create_server_count_data(user3, @data_stored_count + 3)
      end
      
      it 'removes old data in one statement' 

      
      it 'updates and removes data' 

    end
  end
end

