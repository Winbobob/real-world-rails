require "rails_helper"

describe "Internal references", :js do
  include Spec::Support::Helpers::Features::NotesHelpers

  let(:private_project_user) { private_project.owner }
  let(:private_project) { create(:project, :private, :repository) }
  let(:private_project_issue) { create(:issue, project: private_project) }
  let(:private_project_merge_request) { create(:merge_request, source_project: private_project) }
  let(:public_project_user) { public_project.owner }
  let(:public_project) { create(:project, :public, :repository) }
  let(:public_project_issue) { create(:issue, project: public_project) }

  context "when referencing to open issue" do
    context "from private project" do
      context "from issue" do
        before do
          sign_in(private_project_user)

          visit(project_issue_path(private_project, private_project_issue))

          add_note("##{public_project_issue.to_reference(private_project)}")
        end

        context "when user doesn't have access to private project" do
          before do
            sign_in(public_project_user)

            visit(project_issue_path(public_project, public_project_issue))
          end

          it { expect(page).not_to have_css(".note") }
        end
      end

      context "from merge request" do
        before do
          sign_in(private_project_user)

          visit(project_merge_request_path(private_project, private_project_merge_request))

          add_note("##{public_project_issue.to_reference(private_project)}")
        end

        context "when user doesn't have access to private project" do
          before do
            sign_in(public_project_user)

            visit(project_issue_path(public_project, public_project_issue))
          end

          it "doesn't show any references" 

        end

        context "when user has access to private project" do
          before do
            visit(project_issue_path(public_project, public_project_issue))
          end

          it "shows references" 

        end
      end
    end
  end
end

