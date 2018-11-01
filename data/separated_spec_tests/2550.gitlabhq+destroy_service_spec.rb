require 'spec_helper'

describe WikiPages::DestroyService do
  let(:project) { create(:project) }
  let(:user) { create(:user) }
  let(:page) { create(:wiki_page) }

  subject(:service) { described_class.new(project, user) }

  before do
    project.add_developer(user)
  end

  describe '#execute' do
    it 'executes webhooks' 

  end
end

