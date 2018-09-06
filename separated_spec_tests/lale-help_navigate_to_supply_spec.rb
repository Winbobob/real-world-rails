require 'rails_helper'

describe 'Navigate to a supply', js: true do

  let(:circle)        { create(:circle, :with_admin_and_working_group) }
  let(:admin)         { circle.admin }
  let(:working_group) { circle.working_groups.first }

  let(:circle_dashboard) { PageObject::Circle::Dashboard.new }

  describe "supply form" do

    let(:supply_form) { PageObject::Supply::Form.new }

    context "when on the circle dashboard" do

      before { circle_dashboard.load(circle_id: circle.id, as: admin.id) }

      context 'when logged in as admin' do
        it 'can be reached' 

      end
    end

    context "when logged in as volunteer" do
      it "can't be reached" 

    end

  end

  describe "existing supply" do

    let!(:supply) { create(:supply, working_group: working_group) }
    let(:supply_page) { PageObject::Supply::Page.new }

    context 'when user is working group admin' do

      context "when on the circle dashboard" do

        before { circle_dashboard.load(circle_id: circle.id, as: admin.id) }

        it "can be reached" 


      end
    end
  end
end

