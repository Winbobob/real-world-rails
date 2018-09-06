require File.dirname(__FILE__) + '/../../spec_helper'

describe Users::OpenAuthenticationsController do

  before(:each) do
    controller.set_current_user = nil
  end

  before(:all) do
    truncate_all_tables
    Language.create_english
    CuratorLevel.create_enumerated
    @user = User.gen
    @other_user = User.gen
    @admin = User.gen(:admin => true)
  end

  describe 'GET index' do
    it 'should only be accessible by self and administrators' 

  end

  describe 'GET new' do
    it 'should redirect to index unless we have an oauth provider param' 

    it 'should only be accessible by self or admin' 

    it 'should redirect to authorize uri when adding connection to Facebook' 

    it 'should redirect to authorize uri when adding connection to Google' 

    it 'should redirect to authorize uri when adding connection to Twitter' 

    it 'should redirect to authorize uri when adding connection to Yahoo' 


  end

end

