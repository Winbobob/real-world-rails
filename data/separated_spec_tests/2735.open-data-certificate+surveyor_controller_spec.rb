require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SurveyorController do

  let!(:survey)           { FactoryGirl.create(:survey, :title => "Alphabet", :access_code => "alpha", :survey_version => 0)}
  let!(:survey_beta)      { FactoryGirl.create(:survey, :title => "Alphabet", :access_code => "alpha", :survey_version => 1)}
  let!(:response_set)      { FactoryGirl.create(:response_set, :survey => survey, :access_code => "pdq")}
  let!(:response_set_beta) { FactoryGirl.create(:response_set, :survey => survey_beta, :access_code => "rst")}
  before { ResponseSet.stub(:create).and_return(response_set) }

  before do
    user = double('user')
    allow(user).to receive(:admin?).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context "#edit" do
    def do_get(params = {})
      survey.sections = [FactoryGirl.create(:survey_section, :survey => survey)]
      get :edit, {:locale => 'en', :response_set_code => "pdq"}.merge(params)
    end
    it "renders edit" 

    it "assigns survey and response set" 

    it "redirects for missing response set" 

    it "assigns earlier survey_version" 

    it "assigns later survey_version" 

  end

  context "#update" do
    let(:responses_ui_hash) { {} }
    let(:update_params) {
      {
        :locale => 'en',
        :response_set_code => "pdq"
      }
    }
    shared_examples "#update action" do
      before do
        ResponseSet.stub(:find_by_access_code).and_return(response_set)
        responses_ui_hash['11'] = {'api_id' => 'something', 'answer_id' => '56', 'question_id' => '9'}
      end
      it "finds a response set" 

      it "saves responses" 

      it "does not fail when there are no responses" 

      context "with update exceptions" do
        it 'retries the update on a constraint violation' 


        it 'only retries three times' 


        it 'does not retry for other errors' 

      end
    end

    context "with form submission" do
      def do_put(extra_params = {})
        put :update, update_params.merge(extra_params).merge(locale: 'en')
      end

      it_behaves_like "#update action"

      it "completes the found response set on finish" 

      it 'flashes completion' 

      it "redirects for missing response set" 

    end

    context 'with ajax' do
      def do_put(extra_params = {})
        xhr :put, :update, update_params.merge(extra_params)
      end

      it_behaves_like "#update action"
      it "returns dependencies" 

      it "returns 404 for missing response set" 

    end
  end
end

