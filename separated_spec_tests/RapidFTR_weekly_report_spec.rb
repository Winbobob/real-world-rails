require 'spec_helper'

describe WeeklyReport do
  describe '#data' do
    before :each do
      basic_identity_fields = [
        Field.new('name' => 'protection_status', 'display_name' => 'Protection Status', 'type' => 'select_box', 'option_strings_text' => "Unaccompanied\nSeparated"),
        Field.new('name' => 'ftr_status', 'display_name' => 'FTR Status', 'type' => 'select_box', 'option_strings_text' => "Identified\nVerified\nTracing On-Going\nFamily Located-Cross-Border FR Pending\nFamily Located- Inter-Camp FR Pending\nReunited\nExported to CPIMS\nRecord Invalid"),
        Field.new('name' => 'gender', 'display_name' => 'Sex', 'type' => 'select_box', 'option_strings_text' => "Male\nFemale")
      ]
      create :form_section, 'name' => 'Basic Identity', 'visible' => true, :order => 1, :unique_id => 'basic_identity', 'editable' => true, :fields => basic_identity_fields, :perm_enabled => true

      @user = User.new(:user_name => 'faris')
      @child1 = Child.new_with_user_name(@user, :name => 'childOne', :protection_status => 'Unaccompanied', :gender => 'Male', :ftr_status => 'Identified').save!
      @child2 = Child.new_with_user_name(@user, :name => 'childTwo', :protection_status => 'Separated', :gender => 'Male', :ftr_status => 'Tracing On-Going').save!
      @child3 = Child.new_with_user_name(@user, :name => 'childThree', :protection_status => 'Separated', :gender => 'Female', :ftr_status => 'Family Located- Inter-Camp FR Pending').save!
    end

    after :all do
      FormSection.all.each { |form| form.destroy }
      Child.all.each { |c| c.destroy }
      User.all.each { |user| user.destroy }
    end

    it 'should provide data for weekly report' 

  end

  it 'should create document with weekly report data' 


  it 'should schedule every monday' 

end

