require 'rails_helper'

describe "Add and remove circle admins", js: true do
  
  let(:circle)        { create(:circle, :with_admin) }
  let(:admin)         { circle.admin }

  let(:roles_page) { PageObject::Circle::Roles.new }  

  describe "add" do
  
    context "circle has a member that's not admin yet" do

      let!(:circle_member) { create(:circle_role_volunteer, circle: circle).user }

      before { roles_page.load(circle_id: circle.id, as: admin.id) }
      
      it "can be added" 

    end
  end

  describe "remove" do

    context "circle has a member that's not admin yet" do

      let!(:circle_admin) { create(:circle_role_admin, circle: circle).user }

      before { roles_page.load(circle_id: circle.id, as: admin.id) }

      it "can be removed" 

    end
  end

end

