require 'rails_helper'

RSpec.describe ReportsController do
  describe 'POST #create' do
    let(:user) { double('User') }
    let(:project_id) { '1' }
    let(:project) { double('Project') }
    let(:description) { 'Broken link' }

    context 'user authenticated' do
      it 'returns unauthorized header' 

    end

    context 'user unauthenticated' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(Project).to receive(:find).with(project_id).and_return(project)
        allow(ProjectReporter).to receive(:report)
          .with(project: project, reporter: user, description: description).and_return(true)
      end

      it 'reports the project successfully' 

    end
  end
end

