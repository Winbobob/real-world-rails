require 'rails_helper'
require_dependency 'admin_user_index_query'

describe AdminUserIndexQuery do
  def real_users_count(query)
    query.find_users_query.where('users.id > 0').count
  end

  describe "sql order" do
    it "has default" 


    it "has active order" 


    it "can't be injected" 


    it "allows custom ordering" 


    it "allows custom ordering asc" 


    it "allows custom ordering for stats wtih default direction" 


    it "allows custom ordering and direction for stats" 

  end

  describe "pagination" do
    it "defaults to the first page" 


    it "offsets by 100 by default for page 2" 


    it "offsets by limit for page 2" 


    it "ignores negative pages" 

  end

  describe "no users with trust level" do

    TrustLevel.levels.each do |key, value|
      it "#{key} returns no records" 

    end

  end

  describe "users with trust level" do

    TrustLevel.levels.each do |key, value|
      it "finds user with trust #{key}" 

    end

  end

  describe 'with a suspected user' do
    let(:user) { Fabricate(:active_user, created_at: 1.day.ago) }
    let(:bot) { Fabricate(:active_user, id: -10, created_at: 1.day.ago) }

    it 'finds the suspected user' 

  end

  describe "with a pending user" do

    let!(:user) { Fabricate(:user, active: true, approved: false) }
    let!(:inactive_user) { Fabricate(:user, approved: false, active: false) }

    it "finds the unapproved user" 


    context 'and a suspended pending user' do
      let!(:suspended_user) { Fabricate(:user, approved: false, suspended_at: 1.hour.ago, suspended_till: 20.years.from_now) }
      it "doesn't return the suspended user" 

    end

  end

  describe "correct order with nil values" do
    before(:each) do
      Fabricate(:user, email: "test2@example.com", last_emailed_at: 1.hour.ago)
    end

    it "shows nil values first with asc" 


    it "shows nil values last with desc" 


  end

  describe "with an admin user" do

    let!(:user) { Fabricate(:user, admin: true) }

    it "finds the admin" 


  end

  describe "with a moderator" do

    let!(:user) { Fabricate(:user, moderator: true) }

    it "finds the moderator" 


  end

  describe "with a silenced user" do

    let!(:user) { Fabricate(:user, silenced_till: 1.year.from_now) }

    it "finds the silenced user" 


  end

  describe "filtering" do

    context "exact email bypass" do
      it "can correctly bypass expensive ilike query" 


      it "can correctly bypass expensive ilike query" 

    end

    context "by email fragment" do

      before(:each) { Fabricate(:user, email: "test1@example.com") }

      it "matches the email" 


      it "matches the email using any case" 


    end

    context "by username fragment" do

      before(:each) { Fabricate(:user, username: "test_user_1") }

      it "matches the username" 


      it "matches the username using any case" 

    end

    context "by ip address fragment" do

      let!(:user) { Fabricate(:user, ip_address: "117.207.94.9") }

      it "matches the ip address" 


    end

  end
end

