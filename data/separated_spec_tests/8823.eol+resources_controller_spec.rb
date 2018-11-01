require File.dirname(__FILE__) + '/../../spec_helper'

def log_in_for_controller(controller, user)
  session[:user_id] = user.id
  controller.set_current_user = user
end

describe ContentPartners::ResourcesController do

  before(:all) do
    unless @user = User.find_by_username('partner_resources_controller')
      truncate_all_tables
      Language.create_english
      CuratorLevel.create_enumerated
      ContentPartnerStatus.create_enumerated
      License.create_enumerated
      UserIdentity.create_enumerated
      @user = User.gen(:username => 'partner_resources_controller')
    end
    @content_partner = ContentPartner.gen(:user => @user, :full_name => 'Test content partner')
    @content_partner_contact = ContentPartnerContact.gen(:content_partner => @content_partner)
    @resource = Resource.gen(:content_partner => @content_partner)
  end

  describe 'GET index' do
    it 'should render root if user not logged in' 

    it 'should ask for agreement if user can update content partner and agreement is NOT accepted' 

    it 'should render index if user can update content partner and agreement is accepted' 

  end

  describe 'GET new' do
    it 'should render new only if user can create content partner resources' 

  end

#  describe 'POST create' do
#    it 'should create resource only if user can create content partner resources'
#    it 'should rerender new on validation errors'
#    it 'should redirect to content partner resources index on success'
#    it 'should upload resource to server'
#  end

  describe 'GET edit' do
    it 'should render edit only if user can update this content partner resource' 

  end

#  describe 'PUT update' do
#    it 'should update resource only if user can update this content partner resource'
#    it 'should rerender edit on validation errors'
#    it 'should redirect to content partner resources index on success'
#  end

  describe 'GET show' do
    it 'should render root if user not logged in' 

    it 'should render resource show page if user can read content partner resources' 

    it "shows the resource page even if the partner's id is missing" 

  end
  
  describe 'DELETE destroy' do
    
    before(:all) do
      @resource_for_deletion = Resource.gen(:content_partner => @content_partner)
    end
    
    context 'when user can delete resource' do #admin
      
      before(:all) do
        @admin = User.gen
        @admin.grant_admin
      end
      
      it "should call destroy all harvest events related to this resource" 

    end
    
    context 'when user can not delete resource' do # non admins
      it "should raise 'restricted to admin' exception" 

    end
  end

#  describe 'GET and POST harvest_requested' do
#    it 'should change resource status to harvest requested only if user can update resource and state transition is allowed'
#    it 'should redirect back or default on success'
#  end
#
#  describe 'POST publish' do
#    it 'should change resource status to publish pending only if user is EOL administrator and state transition is allowed'
#    it 'should redirect back or default on success'
#  end

end

