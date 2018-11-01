require 'spec_helper'

describe MergeRequests::Conflicts::ListService do
  describe '#can_be_resolved_in_ui?' do
    def create_merge_request(source_branch, target_branch = 'conflict-start')
      create(:merge_request, source_branch: source_branch, target_branch: target_branch, merge_status: :unchecked) do |mr|
        mr.mark_as_unmergeable
      end
    end

    def conflicts_service(merge_request)
      described_class.new(merge_request)
    end

    it 'returns a falsey value when the MR can be merged without conflicts' 


    it 'returns a falsey value when the MR is marked as having conflicts, but has none' 


    it 'returns a falsey value when one of the MR branches is missing' 


    it 'returns a falsey value when the MR does not support new diff notes' 


    it 'returns a falsey value when the conflicts contain a large file' 


    it 'returns a falsey value when the conflicts contain a binary file' 


    it 'returns a falsey value when the conflicts contain a file edited in one branch and deleted in another' 


    it 'returns a truthy value when the conflicts are resolvable in the UI' 


    it 'returns a truthy value when the conflicts have to be resolved in an editor' 


    it 'returns a falsey value when the MR has a missing ref after a force push' 


    it 'returns a falsey value when the MR has a missing revision after a force push' 


    it 'returns a falsey value when the conflict is in a submodule revision' 

  end
end

