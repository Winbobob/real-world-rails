require 'rails_helper'

describe "Invite helpers to a supply", js: true do
  
  let(:circle)        { create(:circle, :with_admin) }
  let(:admin)         { circle.admin }

  let!(:circle_member) { create(:circle_member_role, circle: circle).user }  
  let!(:wg_members)    { create_list(:user, 2) }
  let(:working_group)  { create(:working_group, circle: circle, members: wg_members) }

  let!(:supply) { create(:supply, working_group: working_group) }
  let!(:date) { Date.today.strftime("%B %d, %Y") }
  
  let(:supply_page) { PageObject::Supply::Page.new }

  before { supply_page.load_for(supply, as: admin) }
  
  describe "invite working group" do   
    it "works" 

  end

  describe "invite circle" do
    it "works" 

  end

end

