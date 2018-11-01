require 'spec_helper'

describe WikiPages::UpdateService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:page) { create(:wiki_page) }

  let(:opts) do
    {
      content: 'New content for wiki page',
      format: 'markdown',
      message: 'New wiki message',
      title: 'New Title'
    }
  end

  subject(:service) { described_class.new(project, user, opts) }

  before do
    project.add_developer(user)
  end

  describe '#execute' do
    it 'updates the wiki page' 


    it 'executes webhooks' 

  end
end

