require 'spec_helper'

describe ProjectControllerHelper do
  describe '#code_later_url' do
    let(:url) { helper.code_later_url }

    before do
      Date.stub(:tomorrow) { Date.parse('1971/12/17') }
    end

    it 'returns a url with a start date parameter of tomorrow at 2pm' 


    it 'returns a url with an end date parameter of tomorrow at 6pm' 

  end

  describe '#project_tags_link_list' do
    let(:project) do
      Project.new(
        organization_id: 1,
        name: 'CodeMontage Platform',
        github_repo: 'codemontage'
      )
    end

    before do
      project.stub(:causes) { [double('Tag', name: 'Cause1'), double('Tag', name: 'Cause2')] }
      project.stub(:technologies) { [double('Tag', name: 'Ruby'), double('Tag', name: 'Rails')] }
    end

    context 'given a technologies argument' do
      let(:links_list) { helper.project_tags_link_list(project, 'technologies') }

      it 'returns a list of technology links' 

    end

    context 'given a causes argument' do
      let(:links_list) { helper.project_tags_link_list(project, 'causes') }

      it 'returns a list of cause links' 

    end
  end
end

