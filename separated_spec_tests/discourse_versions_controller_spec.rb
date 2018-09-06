require 'rails_helper'
require_dependency 'version'

describe Admin::VersionsController do

  before do
    Jobs::VersionCheck.any_instance.stubs(:execute).returns(true)
    DiscourseUpdates.stubs(:updated_at).returns(2.hours.ago)
    DiscourseUpdates.stubs(:latest_version).returns('1.2.33')
    DiscourseUpdates.stubs(:critical_updates_available?).returns(false)
  end

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end

    describe 'show' do
      subject { get :show, format: :json }
      it { is_expected.to be_success }

      it 'should return the currently available version' 


      it "should return the installed version" 

    end
  end
end
