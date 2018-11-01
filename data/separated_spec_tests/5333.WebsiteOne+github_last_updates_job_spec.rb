require 'spec_helper'

describe GithubLastUpdatesJob do
  describe '#run' do
    context 'shf-project with hyphen', vcr: true do
      let!(:project) { FactoryBot.create(:project) }
      before { project.source_repositories.create(url: 'https://github.com/AgileVentures/shf-project') }
      it 'has correct last commit date after job run' 

    end
  end
end
