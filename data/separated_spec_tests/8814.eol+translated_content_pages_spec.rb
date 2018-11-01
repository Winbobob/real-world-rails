require File.dirname(__FILE__) + '/../../spec_helper'

describe Admins::TranslatedContentPagesController do
  before(:all) do
    load_foundation_cache
    @admin = User.gen
    @admin.grant_admin
    @cms_user = User.gen
    @cms_user.grant_permission(:edit_cms)
    @normal_user = User.gen
  end

  let(:content_page) { ContentPage.gen }

  before(:each) do
    session[:user_id] = nil
  end

  it 'should redirect non-logged-in users to a login page' 


  it 'should raise SecurityViolation for average_users' 


  it 'should not raise an error for admins or CMS viewers' 


end

