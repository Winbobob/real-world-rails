require 'rails_helper'

describe "Block and unblock a circle member", js: true do

  let(:circle)        { create(:circle, :with_admin, :with_volunteer) }
  let!(:member)       { circle.admin }
  let(:admin)         { create(:circle_admin_role, circle: circle).user }

  let(:member_page) { PageObject::Member::Page.new }

  before { member_page.load(circle_id: circle.id, member_id: member.id, as: admin.id) }

  describe "blocking a member" do
    context "member is not blocked" do

      it "works" 

    end
  end

  describe "unblocking a member" do
    context "member is blocked" do

      before { member_page.block_button.click }

      it "works" 

    end

  end

end

