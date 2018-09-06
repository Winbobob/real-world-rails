require 'spec_helper'

describe 'Projects > Snippets > User comments on a snippet', :js do
  let(:project) { create(:project) }
  let!(:snippet) { create(:project_snippet, project: project, author: user) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_snippet_path(project, snippet))
  end

  it 'leaves a comment on a snippet' 


  it 'should have autocomplete' 


  it 'should have zen mode' 

end

