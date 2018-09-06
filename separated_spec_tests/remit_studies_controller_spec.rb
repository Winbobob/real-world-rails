require "rails_helper"
require "support/devise"
require "support/shared_examples/controllers/concerns/listing_studies"
require "support/shared_examples/controllers/study_management_access_control"

RSpec.describe StudiesController, type: :controller do
  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }
    let(:admin) { FactoryGirl.create(:admin_user) }
    let(:pi) { FactoryGirl.create(:user) }
    let(:rm) { FactoryGirl.create(:user) }
    let(:study) do
      FactoryGirl.create(
        :study,
        principal_investigator_id: pi.id,
        research_manager_id: rm.id
      )
    end

    it "returns http success" 


    it "sets the study" 


    context "when the study is hidden" do
      before do
        study.hidden = true
        study.save!
      end

      context "when a user is the study PI" do
        it "shows the study" 

      end

      context "when a user is the study RM" do
        it "shows the study" 

      end

      context "when a user is an admin" do
        it "shows the study" 

      end

      context "when a user is a normal user" do
        it "hides the study" 

      end

      context "when a user is logged out" do
        it "hides the study" 

      end
    end
  end

  describe "GET #index" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      get :index, user_id: user.id
    end

    it "returns http success" 


    it "renders home/index" 


    it "sets @show_flagged" 


    context "when the user has some principal_investigator studies" do
      let!(:studies) do
        FactoryGirl.create_list(:study, 20, principal_investigator: user)
      end
      let!(:other_studies) do
        FactoryGirl.create_list(:study, 20)
      end

      let(:action) { :index }
      let(:params) { { user_id: user.id } }

      it_behaves_like "study listing controller"

      it "sets @flagged_studies_count" 

    end

    context "when the user has some research_manager studies" do
      let!(:studies) do
        FactoryGirl.create_list(:study, 20, research_manager: user)
      end
      let!(:other_studies) do
        FactoryGirl.create_list(:study, 20)
      end

      let(:action) { :index }
      let(:params) { { user_id: user.id } }

      it_behaves_like "study listing controller"

      it "sets @flagged_studies_count" 

    end

    describe "access control" do
      let(:other_user) { FactoryGirl.create(:user) }
      let(:admin_user) { FactoryGirl.create(:admin_user) }

      it "redirects un-authenticated users to login" 


      it "allows admin to access any page" 


      it "forbids users from accessing other user's pages" 

    end
  end

  describe "PUT #progress_to_delivery" do
    it_behaves_like "study management action" do
      def trigger_action(study)
        study.study_stage = :protocol_erb
        study.protocol_needed = false
        study.save!
        put :progress_to_delivery, study_id: study.id
      end
    end
  end

  describe "PUT #progress_to_completion" do
    it_behaves_like "study management action" do
      def trigger_action(study)
        study.study_stage = :delivery
        study.protocol_needed = false
        study.save!
        put :progress_to_completion, study_id: study.id
      end
    end
  end
end

