require 'spec_helper'

describe 'projects/commit/branches.html.haml' do
  let(:project) { create(:project, :repository) }

  before do
    assign(:project, project)
  end

  context 'when branches and tags are available' do
    before do
      assign(:branches, ['master', 'test-branch'])
      assign(:branches_limit_exceeded, false)
      assign(:tags, ['tag1'])
      assign(:tags_limit_exceeded, false)

      render
    end

    it 'shows default branch' 


    it 'shows js expand link' 


    it 'shows branch and tag links' 

  end

  context 'when branches are available but no tags' do
    before do
      assign(:branches, ['master', 'test-branch'])
      assign(:branches_limit_exceeded, false)
      assign(:tags, [])
      assign(:tags_limit_exceeded, true)

      render
    end

    it 'shows branches' 


    it 'shows js expand link' 


    it 'shows limit exceeded message for tags' 

  end

  context 'when tags are available but no branches (just default)' do
    before do
      assign(:branches, ['master'])
      assign(:branches_limit_exceeded, true)
      assign(:tags, %w(tag1 tag2))
      assign(:tags_limit_exceeded, false)

      render
    end

    it 'shows default branch' 


    it 'shows js expand link' 


    it 'shows tags' 


    it 'shows limit exceeded for branches' 

  end

  context 'when branches and tags are not available' do
    before do
      assign(:branches, ['master'])
      assign(:branches_limit_exceeded, true)
      assign(:tags, [])
      assign(:tags_limit_exceeded, true)

      render
    end

    it 'shows default branch' 


    it 'shows js expand link' 


    it 'shows too many to search' 

  end
end

