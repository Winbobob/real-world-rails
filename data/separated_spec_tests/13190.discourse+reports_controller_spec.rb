require 'rails_helper'

describe Admin::ReportsController do
  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    let(:admin) { Fabricate(:admin) }
    let(:user) { Fabricate(:user) }

    before do
      sign_in(admin)
    end

    describe '#bulk' do
      context "valid params" do
        it "renders the reports as JSON" 

      end

      context "invalid params" do
        context "inexisting report" do
          it "returns only existing reports" 

        end
      end
    end

    describe '#show' do
      context "invalid id form" do
        let(:invalid_id) { "!!&asdfasdf" }

        it "returns 404" 

      end

      context "valid type form" do
        context 'missing report' do
          it "returns a 404 error" 

        end

        context 'a report is found' do
          it "renders the report as JSON" 

        end
      end

      describe 'when report is scoped to a category' do
        let(:category) { Fabricate(:category) }
        let!(:topic) { Fabricate(:topic, category: category) }
        let!(:other_topic) { Fabricate(:topic) }

        it 'should render the report as JSON' 

      end

      describe 'when report is scoped to a group' do
        let(:user) { Fabricate(:user) }
        let!(:other_user) { Fabricate(:user) }
        let(:group) { Fabricate(:group) }

        it 'should render the report as JSON' 

      end
    end
  end
end

