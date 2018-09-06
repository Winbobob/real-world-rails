require 'spec_helper'

describe TreeHelper do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:sha) { 'ce369011c189f62c815f5971d096b26759bab0d1' }

  describe '.render_tree' do
    before do
      @id = sha
      @path = ""
      @project = project
      @lfs_blob_ids = []
    end

    it 'displays all entries without a warning' 


    it 'truncates entries and adds a warning' 

  end

  describe 'flatten_tree' do
    let(:tree) { repository.tree(sha, 'files') }
    let(:root_path) { 'files' }
    let(:tree_item) { tree.entries.find { |entry| entry.path == path } }

    subject { flatten_tree(root_path, tree_item) }

    context "on a directory containing more than one file/directory" do
      let(:path) { 'files/html' }

      it "returns the directory name" 

    end

    context "on a directory containing only one directory" do
      let(:path) { 'files/flat' }

      it "returns the flattened path" 


      context "with a nested root path" do
        let(:root_path) { 'files/flat' }

        it "returns the flattened path with the root path suffix removed" 

      end
    end

    context 'when the root path contains a plus character' do
      let(:root_path) { 'gtk/C++' }
      let(:tree_item) { double(flat_path: 'gtk/C++/glade') }

      it 'returns the flattened path' 

    end
  end

  describe '#commit_in_single_accessible_branch' do
    it 'escapes HTML from the branch name' 

  end
end

