require 'spec_helper'

describe 'Project Network Graph', :js do
  let(:user) { create :user }
  let(:project) { create :project, :repository, namespace: user.namespace }

  before do
    sign_in(user)

    # Stub Graph max_size to speed up test (10 commits vs. 650)
    allow(Network::Graph).to receive(:max_count).and_return(10)
  end

  context 'when branch is master' do
    def switch_ref_to(ref_name)
      first('.js-project-refs-dropdown').click

      page.within '.project-refs-form' do
        click_link ref_name
      end
    end

    def click_show_only_selected_branch_checkbox
      find('#filter_ref').click
    end

    before do
      visit project_network_path(project, 'master')
    end

    it 'renders project network' 


    it 'switches ref to branch' 


    it 'switches ref to tag' 


    it 'renders by commit sha of "v1.0.0"' 


    it 'filters select tag' 


    it 'renders error message when sha commit not exists' 

  end

  it 'renders project network with test branch' 

end

