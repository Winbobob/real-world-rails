# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/alaveteli_dsl')

describe ReportsController do

  describe 'reporting a comment' do

    let(:request) { FactoryGirl.create(:info_request) }
    let(:comment) { FactoryGirl.create(:comment, :info_request => request) }
    let(:user) { FactoryGirl.create(:user) }

    describe 'when not logged in' do

      it "should redirect to the login page" 


      it "should not lose the comment_id post login" 


    end
  end
end

