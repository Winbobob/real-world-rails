require 'rails_helper'

describe "Show circle dashboard", js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:dashboard_page) { PageObject::Circle::Dashboard.new }

  let!(:task)   { create(:task, working_group: working_group) }
  let!(:supply) { create(:supply, working_group: working_group) }
  let!(:project) { create(:project, working_group: working_group) }
  let!(:file) { create(:circle_file_upload, uploadable: circle) }

  describe "Resources listing" do
    before { dashboard_page.load(circle_id: circle.id, as: admin.id) }

    it "shows the circle resources" 

  end

  describe "The add menu" do

    before { dashboard_page.load(circle_id: circle.id, as: user.id) }

    context 'when user is circle admin' do
      let(:user) { admin }
      it "is visible" 

    end

    context 'when user is regular circle member' do
      let(:user) { create(:circle_member_role, circle: circle).user }
      it "is not visible" 

    end

  end
end

