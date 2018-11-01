require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::IssueNew do
  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let(:attachment) { subject[:attachments].first }

  subject { described_class.new(issue).present }

  it { is_expected.to be_a(Hash) }

  it 'shows the issue' 

end

