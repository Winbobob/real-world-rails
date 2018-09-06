require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::IssueMove do
  set(:admin) { create(:admin) }
  set(:project) { create(:project) }
  set(:other_project) { create(:project) }
  set(:old_issue) { create(:issue, project: project) }
  set(:new_issue) { Issues::MoveService.new(project, admin).execute(old_issue, other_project) }
  let(:attachment) { subject[:attachments].first }

  subject { described_class.new(new_issue).present(old_issue) }

  it { is_expected.to be_a(Hash) }

  it 'shows the new issue' 


  it 'mentions the old issue and the new issue in the pretext' 

end

