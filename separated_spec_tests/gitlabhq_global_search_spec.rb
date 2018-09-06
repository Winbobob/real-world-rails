require 'spec_helper'

feature 'Global search' do
  let(:user) { create(:user) }
  let(:project) { create(:project, namespace: user.namespace) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  describe 'I search through the issues and I see pagination' do
    before do
      allow_any_instance_of(Gitlab::SearchResults).to receive(:per_page).and_return(1)
      create_list(:issue, 2, project: project, title: 'initial')
    end

    it "has a pagination" 

  end
end
