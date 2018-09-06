require 'rails_helper'

feature 'Issue markdown toolbar', :js do
  let(:project) { create(:project, :public) }
  let(:issue)   { create(:issue, project: project) }
  let(:user)    { create(:user) }

  before do
    sign_in(user)

    visit project_issue_path(project, issue)
  end

  it "doesn't include first new line when adding bold" 


  it "doesn't include first new line when adding underline" 

end

