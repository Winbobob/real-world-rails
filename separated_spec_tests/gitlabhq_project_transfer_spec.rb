require 'spec_helper'

describe Gitlab::ProjectTransfer do
  before do
    @root_dir = File.join(Rails.root, "public", "uploads")
    @project_transfer = described_class.new
    allow(@project_transfer).to receive(:root_dir).and_return(@root_dir)

    @project_path_was = "test_project_was"
    @project_path = "test_project"
    @namespace_path_was = "test_namespace_was"
    @namespace_path = "test_namespace"
  end

  after do
    FileUtils.rm_rf([
      File.join(@root_dir, @namespace_path),
      File.join(@root_dir, @namespace_path_was)
    ])
  end

  describe '#move_project' do
    it "moves project upload to another namespace" 

  end

  describe '#move_namespace' do
    context 'when moving namespace from root into another namespace' do
      it "moves namespace projects' upload" 

    end

    context 'when moving namespace from one parent to another' do
      it "moves namespace projects' upload" 

    end

    context 'when moving namespace from having a parent to root' do
      it "moves namespace projects' upload" 

    end
  end

  describe '#rename_project' do
    it "renames project" 

  end

  describe '#rename_namespace' do
    it "renames namespace" 

  end
end

