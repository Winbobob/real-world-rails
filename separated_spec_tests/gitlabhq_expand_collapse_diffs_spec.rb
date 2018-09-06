require 'spec_helper'

feature 'Expand and collapse diffs', :js do
  let(:branch) { 'expand-collapse-diffs' }
  let(:project) { create(:project, :repository) }

  before do
    # Set the limits to those when these specs were written, to avoid having to
    # update the test repo every time we change them.
    allow(Gitlab::Git::Diff).to receive(:size_limit).and_return(100.kilobytes)
    allow(Gitlab::Git::Diff).to receive(:collapse_limit).and_return(10.kilobytes)

    sign_in(create(:admin))

    # Ensure that undiffable.md is in .gitattributes
    project.repository.copy_gitattributes(branch)
    visit project_commit_path(project, project.commit(branch))
    execute_script('window.ajaxUris = []; $(document).ajaxSend(function(event, xhr, settings) { ajaxUris.push(settings.url) });')
  end

  def file_container(filename)
    find("[data-blob-diff-path*='#{filename}']")
  end

  # Use define_method instead of let (which is memoized) so that this just works across a
  # reload.
  #
  files = [
    'small_diff.md', 'large_diff.md', 'large_diff_renamed.md', 'undiffable.md',
    'too_large.md', 'too_large_image.jpg'
  ]

  files.each do |file|
    define_method(file.split('.').first) { file_container(file) }
  end

  it 'should show the diff content with a highlighted line when linking to line' 


  it 'should show the diff content when linking to file' 


  context 'visiting a commit with collapsed diffs' do
    it 'shows small diffs immediately' 


    it 'shows non-renderable diffs as such immediately, regardless of their size' 


    it 'does not allow diffs that are larger than the maximum size to be expanded' 


    it 'shows image diffs immediately, regardless of their size' 


    context 'expanding a diff for a renamed file' do
      before do
        large_diff_renamed.find('.click-to-expand').click
        wait_for_requests
      end

      it 'shows the old content' 


      it 'shows the new content' 

    end

    context 'expanding a large diff' do
      before do
        # Wait for diffs
        find('.js-file-title', match: :first)
        # Click `large_diff.md` title
        all('.diff-toggle-caret')[1].click
        wait_for_requests
      end

      it 'shows the diff content' 


      context 'adding a comment to the expanded diff' do
        let(:comment_text) { 'A comment' }

        before do
          large_diff.find('.diff-line-num', match: :prefer_exact).hover
          large_diff.find('.add-diff-note', match: :prefer_exact).click
          large_diff.find('.note-textarea').send_keys comment_text
          large_diff.find_button('Comment').click
          wait_for_requests
        end

        it 'adds the comment' 


        context 'reloading the page' do
          before do
            refresh
          end

          it 'collapses the large diff by default' 


          context 'expanding the diff' do
            before do
              # Wait for diffs
              find('.js-file-title', match: :first)
              # Click `large_diff.md` title
              all('.diff-toggle-caret')[1].click
              wait_for_requests
            end

            it 'shows the diff content' 


            it 'shows the diff comment' 

          end
        end
      end
    end

    context 'collapsing an expanded diff' do
      before do
        # Wait for diffs
        find('.js-file-title', match: :first)
        # Click `small_diff.md` title
        all('.diff-toggle-caret')[3].click
      end

      it 'hides the diff content' 


      context 're-expanding the same diff' do
        before do
          # Wait for diffs
          find('.js-file-title', match: :first)
          # Click `small_diff.md` title
          all('.diff-toggle-caret')[3].click
        end

        it 'shows the diff content' 


        it 'does not make a new HTTP request' 

      end
    end

    context 'expanding a diff when symlink was converted to a regular file' do
      let(:branch) { 'symlink-expand-diff' }

      it 'shows the content of the regular file' 

    end
  end

  context 'visiting a commit without collapsed diffs' do
    let(:branch) { 'feature' }

    it 'does not show Expand all button' 

  end

  context 'visiting a commit with more than safe files' do
    let(:branch) { 'expand-collapse-files' }

    # safe-files -> 100 | safe-lines -> 5000 | commit-files -> 105
    it 'does collapsing from the safe number of files to the end on small files' 

  end

  context 'visiting a commit with more than safe lines' do
    let(:branch) { 'expand-collapse-lines' }

    # safe-files -> 100 | safe-lines -> 5000 | commit_files -> 8 (each 1250 lines)
    it 'does collapsing from the safe number of lines to the end' 

  end

  context 'expanding all diffs' do
    before do
      click_link('Expand all')

      # Wait for elements to appear to ensure full page reload
      expect(page).to have_content('This diff was suppressed by a .gitattributes entry')
      expect(page).to have_content('This source diff could not be displayed because it is too large.')
      expect(page).to have_content('too_large_image.jpg')
      find('.note-textarea')

      wait_for_requests
      execute_script('window.ajaxUris = []; $(document).ajaxSend(function(event, xhr, settings) { ajaxUris.push(settings.url) });')
    end

    it 'reloads the page with all diffs expanded' 


    context 'collapsing an expanded diff' do
      before do
        # Wait for diffs
        find('.js-file-title', match: :first)
        # Click `small_diff.md` title
        all('.diff-toggle-caret')[3].click
      end

      it 'hides the diff content' 


      context 're-expanding the same diff' do
        before do
          # Wait for diffs
          find('.js-file-title', match: :first)
          # Click `small_diff.md` title
          all('.diff-toggle-caret')[3].click
        end

        it 'shows the diff content' 


        it 'does not make a new HTTP request' 

      end
    end
  end
end

