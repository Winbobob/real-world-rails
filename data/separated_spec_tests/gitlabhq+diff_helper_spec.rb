require 'spec_helper'

describe DiffHelper do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:commit) { project.commit(sample_commit.id) }
  let(:diffs) { commit.raw_diffs }
  let(:diff) { diffs.first }
  let(:diff_refs) { commit.diff_refs }
  let(:diff_file) { Gitlab::Diff::File.new(diff, diff_refs: diff_refs, repository: repository) }

  describe 'diff_view' do
    it 'uses the view param over the cookie' 


    it 'returns the default value when the view param is invalid' 


    it 'returns a valid value when cookie is set' 


    it 'returns the default value when cookie is invalid' 


    it 'returns the default value when cookie is nil' 

  end

  describe 'diff_options' do
    it 'returns no collapse false' 


    it 'returns no collapse true if expanded' 


    it 'returns no collapse true if action name diff_for_path' 


    it 'returns paths if action name diff_for_path and param old path' 


    it 'returns paths if action name diff_for_path and param new path' 

  end

  describe '#diff_line_content' do
    context 'when the line is empty' do
      it 'returns a non breaking space' 


      it 'returns an HTML-safe string' 

    end

    context 'when the line is not empty' do
      context 'when the line starts with +, -, or a space' do
        it 'strips the first character' 


        context 'when the line is HTML-safe' do
          it 'returns an HTML-safe string' 

        end

        context 'when the line is not HTML-safe' do
          it 'returns a non-HTML-safe string' 

        end
      end

      context 'when the line does not start with a +, -, or a space' do
        it 'returns the string' 


        context 'when the line is HTML-safe' do
          it 'returns an HTML-safe string' 

        end

        context 'when the line is not HTML-safe' do
          it 'returns a non-HTML-safe string' 

        end
      end
    end
  end

  describe "#mark_inline_diffs" do
    let(:old_line) { %{abc 'def'} }
    let(:new_line) { %{abc "def"} }

    it "returns strings with marked inline diffs" 


    context 'when given HTML' do
      it 'sanitizes it' 


      it 'sanitizes the entire line, not just the changes' 

    end
  end

  describe '#parallel_diff_discussions' do
    let(:discussion) { { 'abc_3_3' => 'comment' } }
    let(:diff_file) { double(line_code: 'abc_3_3') }

    before do
      helper.instance_variable_set(:@grouped_diff_discussions, discussion)
    end

    it 'does not put comments on nonewline lines' 


    it 'puts comments on added lines' 


    it 'puts comments on unchanged lines' 

  end

  describe "#diff_match_line" do
    let(:old_pos) { 40 }
    let(:new_pos) { 50 }
    let(:text) { 'some_text' }

    it "generates foldable top match line for inline view with empty text by default" 


    it "allows to define text and bottom option" 


    it "generates match line for parallel view" 


    it "allows to generate only left match line for parallel view" 


    it "allows to generate only right match line for parallel view" 

  end

  context 'viewer related' do
    let(:viewer) { diff_file.simple_viewer }

    before do
      assign(:project, project)
    end

    describe '#diff_render_error_reason' do
      context 'for error :too_large' do
        before do
          expect(viewer).to receive(:render_error).and_return(:too_large)
        end

        it 'returns an error message' 

      end

      context 'for error :server_side_but_stored_externally' do
        before do
          expect(viewer).to receive(:render_error).and_return(:server_side_but_stored_externally)
          expect(diff_file).to receive(:external_storage).and_return(:lfs)
        end

        it 'returns an error message' 

      end
    end

    describe '#diff_render_error_options' do
      it 'includes a "view the blob" link' 

    end
  end

  context '#diff_file_path_text' do
    it 'returns full path by default' 


    it 'returns truncated path' 

  end
end

