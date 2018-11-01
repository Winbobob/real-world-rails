require 'rails_helper'

describe Teachers::ProgressReportsController do
  it { should use_before_action :authorize! }
  it { should use_before_action :set_vary_header }

  let(:teacher) { create(:teacher) }

  before do
    allow(controller).to receive(:current_user) { teacher }
  end

  describe '#demo' do
    context 'when name not given' do
      context 'when demo account exists' do
        let!(:user) { create(:user, email: "hello+demoteacher@quill.org" ) }

        it 'should use the hello+demot\eacher@quill account and redirect to scorebook teachers classrooms path' 

      end

      context 'when demo account does not exist' do
        before do
          allow(Demo::ReportDemoDestroyer).to receive(:destroy_demo) { true }
          allow(Demo::ReportDemoCreator).to receive(:create_demo) {|name| create(:user, email: "hello+#{name}@quill.org") }
        end

        it 'should destroy the current demo and create a new demo' 

      end
    end

    context 'when name is given' do
      context 'when demo account exists' do
        let!(:user) { create(:user, email: "hello+test@quill.org" ) }

        it 'should use the hello+test@quill account and redirect to scorebook teachers classrooms path' 


        context 'when when name is demoaccount' do
          let!(:user) { create(:user, email: "hello+demoaccount@quill.org" ) }

          it 'should redirect to teachers_progress_reports_concepts_students_path path' 

        end

        context 'when name is admin demo' do
          let!(:user) { create(:user, email: "hello+admin_demo@quill.org" ) }

          it 'should redirect to profile path' 

        end
      end

      context 'when demo account does not exist' do
        before do
          allow(Demo::ReportDemoDestroyer).to receive(:destroy_demo) { true }
          allow(Demo::ReportDemoCreator).to receive(:create_demo) {|name| create(:user, email: "hello+#{name}@quill.org") }
        end

        it 'should destroy the current demo and create a new demo' 

      end
    end
  end

  describe '#admin_demo' do
    context 'when name given' do
      it 'sets the user and redirects to teacher_admin_dashboard path when user exists' 


      it 'sets the user, redirects to teacher_admin_dashboard path when user doesnt exist' 

    end

    context 'when name not given' do
      it 'sets the user and redirect to teacher_admin_dashboard path when user exists' 


      it 'sets the user, redirects to teacher_admin_dashboard path when user does not exist' 

    end
  end

  describe '#landing_page' do
    it 'should render the landing page' 

  end

  describe '#activities_scores_by_classroom' do
    it 'should render the activities scores by classroom' 

  end

  describe '#student_overview' do
    it 'should render the student overview' 

  end
end

