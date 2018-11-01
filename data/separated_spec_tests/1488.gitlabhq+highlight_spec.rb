require 'spec_helper'

describe Gitlab::Diff::Highlight do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:commit) { project.commit(sample_commit.id) }
  let(:diff) { commit.raw_diffs.first }
  let(:diff_file) { Gitlab::Diff::File.new(diff, diff_refs: commit.diff_refs, repository: project.repository) }

  shared_examples 'without inline diffs' do
    let(:code) { '<h2 onmouseover="alert(2)">Test</h2>' }

    before do
      allow(Gitlab::Diff::InlineDiff).to receive(:for_lines).and_return([])
      allow_any_instance_of(Gitlab::Diff::Line).to receive(:text).and_return(code)
    end

    it 'returns html escaped diff text' 

  end

  describe '#highlight' do
    context "with a diff file" do
      let(:subject) { described_class.new(diff_file, repository: project.repository).highlight }

      it 'returns Gitlab::Diff::Line elements' 


      it 'does not modify "match" lines' 


      it 'highlights and marks unchanged lines' 


      it 'highlights and marks removed lines' 


      it 'highlights and marks added lines' 


      context 'when no diff_refs' do
        before do
          allow(diff_file).to receive(:diff_refs).and_return(nil)
        end

        context 'when no inline diffs' do
          it_behaves_like 'without inline diffs'
        end
      end
    end

    context "with diff lines" do
      let(:subject) { described_class.new(diff_file.diff_lines, repository: project.repository).highlight }

      it 'returns Gitlab::Diff::Line elements' 


      it 'does not modify "match" lines' 


      it 'marks unchanged lines' 


      it 'marks removed lines' 


      it 'marks added lines' 


      context 'when the inline diff marker has an invalid range' do
        before do
          allow_any_instance_of(Gitlab::Diff::InlineDiffMarker).to receive(:mark).and_raise(RangeError)
        end

        it 'keeps the original rich line' 


        it 'reports to Sentry if configured' 

      end

      context 'when no inline diffs' do
        it_behaves_like 'without inline diffs'
      end
    end
  end
end

