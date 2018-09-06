require 'spec_helper'

describe 'Subgroup Issuables', :js, :nested_groups do
  let!(:group)    { create(:group, name: 'group') }
  let!(:subgroup) { create(:group, parent: group, name: 'subgroup') }
  let!(:project)  { create(:project, namespace: subgroup, name: 'project') }
  let(:user)      { create(:user) }

  before do
    project.add_master(user)
    sign_in user
  end

  it 'shows the full subgroup title when issues index page is empty' 


  it 'shows the full subgroup title when merge requests index page is empty' 


  def expect_to_have_full_subgroup_title
    title = find('.breadcrumbs-links')

    expect(title).to have_content 'group subgroup project'
  end
end

