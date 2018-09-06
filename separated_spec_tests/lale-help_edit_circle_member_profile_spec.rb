require 'rails_helper'

describe "Edit a circle member profile", js: true do

  let(:volunteer)     { create(:user) }
  let(:circle)        { create(:circle, :with_admin_and_working_group, volunteer: volunteer) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:member_form) { PageObject::Member::Form.new }

  let(:inputs) { { first_name: 'Emil', last_name: 'Emu' } }

  context "when user is circle admin" do
    
    let(:current_user) { admin }

    context "when editing own profile" do

      let(:user) { current_user }
      before { member_form.load(circle_id: circle.id, id: user.id, as: current_user.id) }

      it "works" 

    end

    context "when editing other member's profile" do

      let(:user) { volunteer }
      before { member_form.load(circle_id: circle.id, id: user.id, as: current_user.id) }

      it "works" 

    end
  end

  context "when user is circle member" do

    let(:current_user) { volunteer }

    context "when editing own profile" do
      
      let(:user) { current_user }
      before { member_form.load(circle_id: circle.id, id: user.id, as: current_user.id) }

      it "works" 

    end

    context "when editing other member's profile" do

      let(:user) { admin }
      before { member_form.load(circle_id: circle.id, id: user.id, as: current_user.id) }
      let(:member_page) { PageObject::Member::Page.new }

      it "is not possible" 

    end
  end

end

