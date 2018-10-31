require 'spec_helper'

describe Gitlab::SlashCommands::Presenters::IssueSearch do
  let(:project) { create(:project) }
  let(:message) { subject[:text] }

  before do
    create_list(:issue, 2, project: project)
  end

  subject { described_class.new(project.issues).present }

  it 'formats the message correct' 


  it 'shows a list of results' 

end

