# frozen_string_literal: true

RSpec.describe Bundler::Plugin::SourceList do
  SourceList = Bundler::Plugin::SourceList

  before do
    allow(Bundler).to receive(:root) { Pathname.new "/" }
  end

  subject(:source_list) { SourceList.new }

  describe "adding sources uses classes for plugin" do
    it "uses Plugin::Installer::Rubygems for rubygems sources" 


    it "uses Plugin::Installer::Git for git sources" 

  end
end

