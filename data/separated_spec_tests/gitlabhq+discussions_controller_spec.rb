require 'spec_helper'

describe Projects::DiscussionsController do
  let(:user) { create(:user) }
  let(:merge_request) { create(:merge_request) }
  let(:project) { merge_request.source_project }
  let(:note) { create(:discussion_note_on_merge_request, noteable: merge_request, project: project) }
  let(:discussion) { note.discussion }

  let(:request_params) do
    {
      namespace_id: project.namespace,
      project_id: project,
      merge_request_id: merge_request,
      id: note.discussion_id
    }
  end

  describe 'GET show' do
    before do
      sign_in user
    end

    context 'when user is not authorized to read the MR' do
      it 'returns 404' 

    end

    context 'when user is authorized to read the MR' do
      before do
        project.add_reporter(user)
      end

      it 'returns status 200' 


      it 'returns status 404 if MR does not exists' 

    end

    context 'when user is authorized but note is LegacyDiffNote' do
      before do
        project.add_developer(user)
        note.update!(type: 'LegacyDiffNote')
      end

      it 'returns status 200' 

    end
  end

  describe 'POST resolve' do
    before do
      sign_in user
    end

    context "when the user is not authorized to resolve the discussion" do
      it "returns status 404" 

    end

    context "when the user is authorized to resolve the discussion" do
      before do
        project.add_developer(user)
      end

      context "when the discussion is not resolvable" do
        before do
          note.update(system: true)
        end

        it "returns status 404" 

      end

      context "when the discussion is resolvable" do
        it "resolves the discussion" 


        it "sends notifications if all discussions are resolved" 


        it "returns the name of the resolving user" 


        it "returns status 200" 


        it "renders discussion with serializer" 


        context 'diff discussion' do
          let(:note) { create(:diff_note_on_merge_request, noteable: merge_request, project: project) }
          let(:discussion) { note.discussion }

          it "returns truncated diff lines" 

        end
      end
    end
  end

  describe 'DELETE unresolve' do
    before do
      sign_in user

      note.discussion.resolve!(user)
    end

    context "when the user is not authorized to resolve the discussion" do
      it "returns status 404" 

    end

    context "when the user is authorized to resolve the discussion" do
      before do
        project.add_developer(user)
      end

      context "when the discussion is not resolvable" do
        before do
          note.update(system: true)
        end

        it "returns status 404" 

      end

      context "when the discussion is resolvable" do
        it "unresolves the discussion" 


        it "returns status 200" 


        context "when vue_mr_discussions cookie is present" do
          before do
            allow(controller).to receive(:cookies).and_return({ vue_mr_discussions: 'true' })
          end

          it "renders discussion with serializer" 

        end
      end
    end
  end
end

