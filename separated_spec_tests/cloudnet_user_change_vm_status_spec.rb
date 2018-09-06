require 'rails_helper'

describe UserAnalytics::UserChangeVmStatus do
  
  context 'shrinking' do
    before :each do
      @user = FactoryGirl.create(:user)
      date = Date.today
      35.times do |i|
        count = i < 15 ? 1 : 2
        FactoryGirl.create(:user_server_count, user: @user, date: date, servers_count: count)
        date -= 1.day
      end
    end
  
    subject{ UserAnalytics::UserChangeVmStatus.new(@user) }
  
    it 'marks as shrinking' 

    
    it 'creates proper tag' 

    
    it 'removes old tags' 

  end
  
  context 'growing' do
    before :each do
      @user = FactoryGirl.create(:user)
      date = Date.today
      35.times do |i|
        count = i < 15 ? 2 : 1
        FactoryGirl.create(:user_server_count, user: @user, date: date, servers_count: count)
        date -= 1.day
      end
    end
  
    subject{ UserAnalytics::UserChangeVmStatus.new(@user) }
  
    it 'mark as growing' 

  end
  
  context 'stable' do
    before :each do
      @user = FactoryGirl.create(:user)
      date = Date.today
      35.times do |i|
        count = i < 25 ? 1 : 2
        FactoryGirl.create(:user_server_count, user: @user, date: date, servers_count: count)
        date -= 1.day
      end
    end
  
    subject{ UserAnalytics::UserChangeVmStatus.new(@user) }
  
    it 'mark as stable' 

  end
end

