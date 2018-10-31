require 'spec_helper'

describe Banzai::Filter::IssuableStateFilter do
  include ActionView::Helpers::UrlHelper
  include FilterSpecHelper

  let(:user) { create(:user) }
  let(:context) { { current_user: user, issuable_state_filter_enabled: true } }
  let(:closed_issue) { create_issue(:closed) }
  let(:project) { create(:project, :public) }
  let(:group) { create(:group) }
  let(:other_project) { create(:project, :public) }

  def create_link(text, data)
    link_to(text, '', class: 'gfm has-tooltip', data: data)
  end

  def create_issue(state)
    create(:issue, state, project: project)
  end

  def create_merge_request(state)
    create(:merge_request, state,
      source_project: project, target_project: project)
  end

  it 'ignores non-GFM links' 


  it 'ignores non-issuable links' 


  it 'ignores issuable links with empty content' 


  it 'ignores issuable links with custom anchor' 


  it 'ignores issuable links to specific comments' 


  it 'ignores merge request links to diffs tab' 


  it 'handles cross project references' 


  it 'handles references from group scopes' 


  it 'skips cross project references if the user cannot read cross project' 


  it 'does not append state when filter is not enabled' 


  context 'when project is in pending delete' do
    before do
      project.update!(pending_delete: true)
    end

    it 'does not append issue state' 

  end

  context 'for issue references' do
    it 'ignores open issue references' 


    it 'appends state to closed issue references' 

  end

  context 'for merge request references' do
    it 'ignores open merge request references' 


    it 'ignores reopened merge request references' 


    it 'ignores locked merge request references' 


    it 'appends state to closed merge request references' 


    it 'appends state to merged merge request references' 

  end
end

