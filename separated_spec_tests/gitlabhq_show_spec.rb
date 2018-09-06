require 'spec_helper'

feature 'Snippet', :js do
  let(:project) { create(:project, :repository) }
  let(:snippet) { create(:personal_snippet, :public, file_name: file_name, content: content) }

  context 'Ruby file' do
    let(:file_name) { 'popen.rb' }
    let(:content) { project.repository.blob_at('master', 'files/ruby/popen.rb').data }

    before do
      visit snippet_path(snippet)

      wait_for_requests
    end

    it 'displays the blob' 

  end

  context 'Markdown file' do
    let(:file_name) { 'ruby-style-guide.md' }
    let(:content) { project.repository.blob_at('master', 'files/markdown/ruby-style-guide.md').data }

    context 'visiting directly' do
      before do
        visit snippet_path(snippet)

        wait_for_requests
      end

      it 'displays the blob using the rich viewer' 


      context 'switching to the simple viewer' do
        before do
          find('.js-blob-viewer-switch-btn[data-viewer=simple]').click

          wait_for_requests
        end

        it 'displays the blob using the simple viewer' 


        context 'switching to the rich viewer again' do
          before do
            find('.js-blob-viewer-switch-btn[data-viewer=rich]').click

            wait_for_requests
          end

          it 'displays the blob using the rich viewer' 

        end
      end
    end

    context 'visiting with a line number anchor' do
      before do
        visit snippet_path(snippet, anchor: 'L1')

        wait_for_requests
      end

      it 'displays the blob using the simple viewer' 

    end
  end
end

