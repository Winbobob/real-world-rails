require 'spec_helper'
require 'helpers/fake_record_with_history'

describe 'child_histories/index.html.erb', :type => :view do

  describe 'child history' do
    before do
      allow(FormSection).to receive(:all_child_field_names).and_return(%w(age last_known_location current_photo_key))
      @user = double(:user)
    end

    describe 'rendering history for a newly created record' do
      it 'should render only the creation record' 


      it "should display the date/time of creation using the user's timezone setting" 


    end

    describe 'rendering the history of a flagged child record' do
      before do
        # Set up a child record and then flag it as suspect
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('US/Samoa')
        allow(@user).to receive(:localize_date).and_return '2010-12-31 09:55:00 SST'
      end

      it "should display the date/time of the change using the user's timezone setting" 


      it "should correctly format the change's' date/time" 

    end

    describe 'rendering changes to photos' do
      before do
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('UTC')
        allow(@user).to receive(:localize_date).and_return '2010-12-31 20:55:00 UTC'
      end

      it 'should render photo change record with links when adding a photo to an existing record' 


      it 'should render photo change record with links when adding photos to an existing record' 


      it "should display the date/time of the change using the user's timezone setting" 


      it "should correctly format the change's date/time" 

    end

    describe 'rendering changes to audio' do
      before do
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('UTC')
        allow(@user).to receive(:localize_date).and_return '2010-12-31 20:55:00 UTC'
      end

      it 'should render audio change record' 


      it 'should render audio change record with links when adding a sound file to an existing record for first time' 


      it "should display the date/time of the change using the user's timezone setting" 


      it "should correctly format the change's date/time" 

    end

    describe 'rendering several history entries' do
      before do
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('UTC')
        allow(@user).to receive(:localize_date).and_return ''
      end

      it 'should order history log from most recent change to oldest change' 

    end

    describe 'rendering changes to general attributes' do
      before do
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('US/Samoa')
        allow(@user).to receive(:localize_date).and_return '2010-12-31 09:55:00 SST'
      end

      it "should display the date/time of the change using the user's timezone setting" 


      it "should correctly format the change's date/time" 

    end

    describe 'rendering the history of a reunited child record' do
      before do
        # Set up a child record and then flag it as suspect
        @user = double(:user)
        allow(@user).to receive(:time_zone).and_return TZInfo::Timezone.get('US/Samoa')
        allow(@user).to receive(:localize_date).and_return '2010-12-31 09:55:00 SST'
      end

      it "should display the date/time of the change using the user's timezone setting" 


      it "should correctly format the change's' date/time" 

    end
  end
end

