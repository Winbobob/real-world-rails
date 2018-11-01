require 'spec_helper'

describe 'projects/commits/_commit.html.haml' do
  before do
    allow(view).to receive(:current_application_settings).and_return(Gitlab::CurrentSettings.current_application_settings)
  end

  context 'with a singed commit' do
    let(:project) { create(:project, :repository) }
    let(:repository) { project.repository }
    let(:ref) { GpgHelpers::SIGNED_COMMIT_SHA }
    let(:commit) { repository.commit(ref) }

    it 'does not display a loading spinner for GPG status' 

  end
end

