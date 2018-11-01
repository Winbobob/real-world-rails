require 'spec_helper'

describe Gitlab::Highlight do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }

  describe 'language provided' do
    let(:highlighter) do
      described_class.new('foo.erb', 'bar', language: 'erb?parent=json')
    end

    it 'sets correct lexer' 

  end

  describe '#highlight' do
    let(:file_name) { 'test.lisp' }
    let(:no_context_content) { ":type \"assem\"))" }
    let(:content) { "(make-pathname :defaults name\n#{no_context_content}" }
    let(:multiline_content) do
      %q(
      def test(input):
        """This is line 1 of a multi-line comment.
        This is line 2.
        """
      )
    end

    it 'highlights' 


    it 'returns plain version for unknown lexer context' 


    it 'returns plain version for long content' 


    it 'highlights multi-line comments' 


    context 'diff highlighting' do
      let(:file_name) { 'test.diff' }
      let(:content) { "+aaa\n+bbb\n- ccc\n ddd\n"}
      let(:expected) do
        %q(<span id="LC1" class="line" lang="diff"><span class="gi">+aaa</span></span>
<span id="LC2" class="line" lang="diff"><span class="gi">+bbb</span></span>
<span id="LC3" class="line" lang="diff"><span class="gd">- ccc</span></span>
<span id="LC4" class="line" lang="diff"> ddd</span>)
      end

      it 'highlights each line properly' 

    end

    describe 'with CRLF' do
      let(:branch) { 'crlf-diff' }
      let(:path) { 'files/whitespace' }
      let(:blob) { repository.blob_at_branch(branch, path) }
      let(:lines) do
        described_class.highlight(blob.path, blob.data).lines
      end

      it 'strips extra LFs' 

    end

    it 'links dependencies via DependencyLinker' 


    context 'timeout' do
      subject { described_class.new('file.name', 'Contents') }

      it 'utilizes timeout for web' 


      it 'utilizes longer timeout for sidekiq' 

    end
  end
end

