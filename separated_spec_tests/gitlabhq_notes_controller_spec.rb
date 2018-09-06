require 'spec_helper'

describe Snippets::NotesController do
  let(:user) { create(:user) }

  let(:private_snippet)  { create(:personal_snippet, :private) }
  let(:internal_snippet) { create(:personal_snippet, :internal) }
  let(:public_snippet)   { create(:personal_snippet, :public) }

  let(:note_on_private)  { create(:note_on_personal_snippet, noteable: private_snippet) }
  let(:note_on_internal) { create(:note_on_personal_snippet, noteable: internal_snippet) }
  let(:note_on_public)   { create(:note_on_personal_snippet, noteable: public_snippet) }

  describe 'GET index' do
    context 'when a snippet is public' do
      before do
        note_on_public

        get :index, { snippet_id: public_snippet }
      end

      it "returns status 200" 


      it "returns not empty array of notes" 

    end

    context 'when a snippet is internal' do
      before do
        note_on_internal
      end

      context 'when user not logged in' do
        it "returns status 404" 

      end

      context 'when user logged in' do
        before do
          sign_in(user)
        end

        it "returns status 200" 

      end
    end

    context 'when a snippet is private' do
      before do
        note_on_private
      end

      context 'when user not logged in' do
        it "returns status 404" 

      end

      context 'when user other than author logged in' do
        before do
          sign_in(user)
        end

        it "returns status 404" 

      end

      context 'when author logged in' do
        before do
          note_on_private

          sign_in(private_snippet.author)
        end

        it "returns status 200" 


        it "returns 1 note" 

      end
    end

    context 'dont show non visible notes' do
      before do
        note_on_public

        sign_in(user)

        expect_any_instance_of(Note).to receive(:cross_reference_not_visible_for?).and_return(true)
      end

      it "does not return any note" 

    end
  end

  describe 'DELETE destroy' do
    let(:request_params) do
      {
        snippet_id: public_snippet,
        id: note_on_public,
        format: :js
      }
    end

    context 'when user is the author of a note' do
      before do
        sign_in(note_on_public.author)
      end

      it "returns status 200" 


      it "deletes the note" 


      context 'system note' do
        before do
          expect_any_instance_of(Note).to receive(:system?).and_return(true)
        end

        it "does not delete the note" 

      end
    end

    context 'when user is not the author of a note' do
      before do
        sign_in(user)

        note_on_public
      end

      it "returns status 404" 


      it "does not update the note" 

    end
  end

  describe 'POST toggle_award_emoji' do
    let(:note) { create(:note_on_personal_snippet, noteable: public_snippet) }
    before do
      sign_in(user)
    end

    subject { post(:toggle_award_emoji, snippet_id: public_snippet, id: note.id, name: "thumbsup") }

    it "toggles the award emoji" 


    it "removes the already awarded emoji when it exists" 

  end
end

