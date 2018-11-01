require 'spec_helper'

describe PreviewMarkdownService do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    project.add_developer(user)
  end

  describe 'user references' do
    let(:params) { { text: "Take a look #{user.to_reference}" } }
    let(:service) { described_class.new(project, user, params) }

    it 'returns users referenced in text' 

  end

  context 'new note with quick actions' do
    let(:issue) { create(:issue, project: project) }
    let(:params) do
      {
        text: "Please do it\n/assign #{user.to_reference}",
        quick_actions_target_type: 'Issue',
        quick_actions_target_id: issue.id
      }
    end
    let(:service) { described_class.new(project, user, params) }

    it 'removes quick actions from text' 


    it 'explains quick actions effect' 

  end

  context 'merge request description' do
    let(:params) do
      {
        text: "My work\n/estimate 2y",
        quick_actions_target_type: 'MergeRequest'
      }
    end
    let(:service) { described_class.new(project, user, params) }

    it 'removes quick actions from text' 


    it 'explains quick actions effect' 

  end

  context 'commit description' do
    let(:project) { create(:project, :repository) }
    let(:commit) { project.commit }
    let(:params) do
      {
        text: "My work\n/tag v1.2.3 Stable release",
        quick_actions_target_type: 'Commit',
        quick_actions_target_id: commit.id
      }
    end
    let(:service) { described_class.new(project, user, params) }

    it 'removes quick actions from text' 


    it 'explains quick actions effect' 

  end

  it 'sets correct markdown engine' 


  it 'honors the legacy_render parameter' 

end

