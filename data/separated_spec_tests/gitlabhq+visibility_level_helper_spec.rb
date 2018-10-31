require 'spec_helper'

describe VisibilityLevelHelper do
  include ProjectForksHelper

  let(:project)          { build(:project) }
  let(:group)            { build(:group) }
  let(:personal_snippet) { build(:personal_snippet) }
  let(:project_snippet)  { build(:project_snippet) }

  describe 'visibility_icon_description' do
    context 'used with a Project' do
      it 'delegates projects to #project_visibility_icon_description' 


      context 'used with a ProjectPresenter' do
        it 'delegates projects to #project_visibility_icon_description' 

      end

      context 'used with a Group' do
        it 'delegates groups to #group_visibility_icon_description' 

      end
    end
  end

  describe 'visibility_level_description' do
    context 'used with a Project' do
      it 'delegates projects to #project_visibility_level_description' 

    end

    context 'used with a Group' do
      it 'delegates groups to #group_visibility_level_description' 

    end

    context 'called with a Snippet' do
      it 'delegates snippets to #snippet_visibility_level_description' 

    end
  end

  describe "#project_visibility_level_description" do
    it "describes private projects" 


    it "describes public projects" 

  end

  describe "#snippet_visibility_level_description" do
    it 'describes visibility only for me' 


    it 'describes visibility for project members' 


    it 'defaults to personal snippet' 

  end

  describe "disallowed_visibility_level?" do
    describe "forks" do
      let(:project) { create(:project, :internal) }
      let(:forked_project) { fork_project(project) }

      it "disallows levels" 

    end

    describe "non-forked project" do
      let(:project) { create(:project, :internal) }

      it "disallows levels" 

    end

    describe "group" do
      let(:group) { create(:group, :internal) }

      it "disallows levels" 

    end

    describe "sub-group" do
      let(:group) { create(:group, :private) }
      let(:subgroup) { create(:group, :private, parent: group) }

      it "disallows levels" 

    end

    describe "snippet" do
      let(:snippet) { create(:snippet, :internal) }

      it "disallows levels" 

    end
  end

  describe "disallowed_visibility_level_description" do
    let(:group) { create(:group, :internal) }
    let!(:subgroup) { create(:group, :internal, parent: group) }
    let!(:project) { create(:project, :internal, group: group) }

    describe "project" do
      it "provides correct description for disabled levels" 

    end

    describe "group" do
      it "provides correct description for disabled levels" 

    end
  end
end

