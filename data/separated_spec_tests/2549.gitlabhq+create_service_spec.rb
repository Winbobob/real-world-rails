require 'spec_helper'

describe WikiPages::CreateService do
  let(:project) { create(:project, :wiki_repo) }
  let(:user) { create(:user) }

  let(:opts) do
    {
      title: 'Title',
      content: 'Content for wiki page',
      format: 'markdown'
    }
  end

  subject(:service) { described_class.new(project, user, opts) }

  before do
    project.add_developer(user)
  end

  describe '#execute' do
    it 'creates wiki page with valid attributes' 


    it 'executes webhooks' 

  end
end

