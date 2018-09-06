require 'rails_helper'

describe Admin::ReportsController do
  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    let!(:admin) { log_in(:admin) }
    let(:user) { Fabricate(:user) }

    context '.show' do

      context "invalid id form" do
        let(:invalid_id) { "!!&asdfasdf" }

        it "never calls Report.find" 


        it "returns 404" 

      end

      context "valid type form" do

        context 'missing report' do
          before do
            Report.expects(:find).with('active', instance_of(Hash)).returns(nil)
            get :show, params: { type: 'active' }, format: :json
          end

          it "renders the report as JSON" 

        end

        context 'a report is found' do
          before do
            Report.expects(:find).with('active', instance_of(Hash)).returns(Report.new('active'))
            get :show, params: { type: 'active' }, format: :json
          end

          it "renders the report as JSON" 


          it "renders the report as JSON" 


        end

      end

      describe 'when report is scoped to a category' do
        let(:category) { Fabricate(:category) }
        let(:topic) { Fabricate(:topic, category: category) }
        let(:other_topic) { Fabricate(:topic) }

        it 'should render the report as JSON' 

      end

      describe 'when report is scoped to a group' do
        let(:user) { Fabricate(:user) }
        let(:other_user) { Fabricate(:user) }
        let(:group) { Fabricate(:group) }

        it 'should render the report as JSON' 

      end

    end

  end

end

