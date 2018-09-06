require "spec_helper"

describe PendingHarvestsController do

  before(:all) do
    CuratorLevel.create_enumerated
    ContentPartnerStatus.create_enumerated
    ResourceStatus.create_enumerated
    @admin = User.gen(admin: true)
    @full = FactoryGirl.create(:curator)
    @master = FactoryGirl.create(:master_curator)
    @content_partner = ContentPartner.gen(user: User.gen, content_partner_status: ContentPartnerStatus.active)
    @lang = Language.gen
    @license = License.gen
    res = Resource.gen(license_id: @license.id, language_id: @lang.id, content_partner: @content_partner, resource_status_id: ResourceStatus.processed.id)
  end

  describe 'GET index' do
    context 'grant access for admins and master curators'do
      it 'should work for admins' 


      it 'should work for master curators' 

    end

    context 'deny access for other users' do
      it 'should deny access for full curators' 


      it 'should deny access normal user' 


      it 'should deny access for non-logged-in user' 

    end

    context 'check on ready (pending) resources' do
      it 'should get the ready resources only' 

    end
  end
end

