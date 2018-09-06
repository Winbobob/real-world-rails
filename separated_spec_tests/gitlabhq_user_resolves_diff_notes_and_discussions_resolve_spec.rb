require 'rails_helper'

describe 'Merge request > User resolves diff notes and discussions', :js do
  let(:project)       { create(:project, :public, :repository) }
  let(:user)          { project.creator }
  let(:guest)         { create(:user) }
  let(:merge_request) { create(:merge_request_with_diffs, source_project: project, author: user, title: "Bug NS-04") }
  let!(:note)         { create(:diff_note_on_merge_request, project: project, noteable: merge_request, note: "| Markdown | Table |\n|-------|---------|\n| first | second |") }
  let(:path)          { "files/ruby/popen.rb" }
  let(:position) do
    Gitlab::Diff::Position.new(
      old_path: path,
      new_path: path,
      old_line: nil,
      new_line: 9,
      diff_refs: merge_request.diff_refs
    )
  end

  context 'no discussions' do
    before do
      project.add_master(user)
      sign_in(user)
      note.destroy
      visit_merge_request
    end

    it 'displays no discussion resolved data' 

  end

  context 'as authorized user' do
    before do
      project.add_master(user)
      sign_in(user)
      visit_merge_request
    end

    context 'single discussion' do
      it 'shows text with how many discussions' 


      it 'allows user to mark a note as resolved' 


      it 'allows user to mark discussion as resolved' 


      it 'allows user to unresolve discussion' 


      describe 'resolved discussion' do
        before do
          page.within '.diff-content' do
            click_button 'Resolve discussion'
          end

          visit_merge_request
        end

        describe 'timeline view' do
          it 'hides when resolve discussion is clicked' 


          it 'shows resolved discussion when toggled' 


          it 'renders tables in lazy-loaded resolved diff dicussions' 

        end

        describe 'side-by-side view' do
          before do
            page.within('.merge-request-tabs') { click_link 'Changes' }
            page.find('#parallel-diff-btn').click
          end

          it 'hides when resolve discussion is clicked' 


          it 'shows resolved discussion when toggled' 

        end
      end

      it 'allows user to resolve from reply form without a comment' 


      it 'allows user to unresolve from reply form without a comment' 


      it 'allows user to comment & resolve discussion' 


      it 'allows user to comment & unresolve discussion' 


      it 'allows user to quickly scroll to next unresolved discussion' 


      it 'hides jump to next button when all resolved' 


      it 'updates updated text after resolving note' 


      it 'hides jump to next discussion button' 

    end

    context 'multiple notes' do
      before do
        create(:diff_note_on_merge_request, project: project, noteable: merge_request, in_reply_to: note)
        visit_merge_request
      end

      it 'does not mark discussion as resolved when resolving single note' 


      it 'resolves discussion' 

    end

    context 'muliple discussions' do
      before do
        create(:diff_note_on_merge_request, project: project, position: position, noteable: merge_request)
        visit_merge_request
      end

      it 'shows text with how many discussions' 


      it 'allows user to mark a single note as resolved' 


      it 'allows user to mark all notes as resolved' 


      it 'allows user user to mark all discussions as resolved' 


      it 'allows user to quickly scroll to next unresolved discussion' 


      it 'updates updated text after resolving note' 


      it 'shows jump to next discussion button' 


      it 'displays next discussion even if hidden' 

    end

    context 'changes tab' do
      it 'shows text with how many discussions' 


      it 'allows user to mark a note as resolved' 


      it 'allows user to mark discussion as resolved' 


      it 'allows user to unresolve discussion' 


      it 'allows user to comment & resolve discussion' 


      it 'allows user to comment & unresolve discussion' 

    end
  end

  context 'as a guest' do
    before do
      project.add_guest(guest)
      sign_in(guest)
    end

    context 'someone elses merge request' do
      before do
        visit_merge_request
      end

      it 'does not allow user to mark note as resolved' 


      it 'does not allow user to mark discussion as resolved' 

    end

    context 'guest users merge request' do
      let(:user) { guest }

      before do
        visit_merge_request
      end

      it 'allows user to mark a note as resolved' 

    end
  end

  context 'unauthorized user' do
    context 'no resolved comments' do
      before do
        visit_merge_request
      end

      it 'does not allow user to mark note as resolved' 

    end

    context 'resolved comment' do
      before do
        note.resolve!(user)
        visit_merge_request
      end

      it 'shows resolved icon' 


      it 'does not allow user to click resolve button' 

    end
  end

  def visit_merge_request(mr = nil)
    mr ||= merge_request
    visit project_merge_request_path(mr.project, mr)
  end
end

