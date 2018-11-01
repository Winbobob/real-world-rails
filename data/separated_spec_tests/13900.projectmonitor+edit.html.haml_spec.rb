require 'spec_helper'

describe 'projects/edit', :type => :view do
  let(:creator) { nil }
  let(:project) { create(:travis_project, creator: creator) }

  before(:each) do
    assign(:project, project)
    render
  end

  describe "information about project creator" do
    context "when the creator is missing" do
      it "does not include creator's information" 

    end

    context "when the creator is present" do
      let(:creator) { create(:user) }

      it "has creator's name & email" 

    end
  end

  describe "error messages" do
    it "should not be visible when the page is first rendered" 


    context "for an invalid project" do
      let(:project) do
        project = create(:travis_project)
        project.name = ''
        project.valid? # ensure errors are present, mimic the controller Update action validation
        project
      end

      it "should be visible" 

    end
  end

  describe 'project-specific attributes' do
    it 'should the specific attributes for a given project type' 


    it 'should not include attributes specific to other projects' 


    describe 'visibility' do
      it 'should show attributes specific to the current project type' 


      it 'should show instructions specific to project' 


      it 'should hide attributes specific to other project types' 

    end

    describe 'field labels' do
      it 'is overriden for a specific projects' 


      it 'remains the default otherwise' 

    end

    describe 'a help block' do
      it 'is shown for a Travis Pro project' 


      it 'is not shown when no tooltip is defined' 

    end

    describe 'concourse team name' do
      it 'should not be visible for non-concourse projects' 


      it 'should be visible for concourse v2+ projects' 

    end

  end
end

