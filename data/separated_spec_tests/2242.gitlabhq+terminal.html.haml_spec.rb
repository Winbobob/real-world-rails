require 'spec_helper'

describe 'projects/environments/terminal' do
  let!(:environment) { create(:environment, :with_review_app) }

  before do
    assign(:environment, environment)
    assign(:project, environment.project)

    allow(view).to receive(:can?).and_return(true)
  end

  context 'when environment has external URL' do
    it 'shows external URL button' 

  end

  context 'when environment does not have external URL' do
    it 'shows external URL button' 

  end
end

