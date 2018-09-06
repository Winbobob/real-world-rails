require "spec_helper"

describe "projects/imports/new.html.haml" do
  let(:user) { create(:user) }

  context 'when import fails' do
    let(:project) { create(:project_empty_repo, :import_failed, import_type: :gitlab_project, import_source: '/var/opt/gitlab/gitlab-rails/shared/tmp/project_exports/uploads/t.tar.gz', import_url: nil) }

    before do
      project.import_state.update_attributes(last_error: '<a href="http://googl.com">Foo</a>')
      sign_in(user)
      project.add_master(user)
    end

    it "escapes HTML in import errors" 

  end
end
