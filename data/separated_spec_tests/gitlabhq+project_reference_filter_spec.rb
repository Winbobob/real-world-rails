# frozen_string_literal: true

require 'spec_helper'

describe Banzai::Filter::ProjectReferenceFilter do
  include FilterSpecHelper

  def invalidate_reference(reference)
    "#{reference.reverse}"
  end

  def get_reference(project)
    project.to_reference_with_postfix
  end

  let(:project)   { create(:project, :public) }
  subject { project }
  let(:subject_name) { "project" }
  let(:reference) { get_reference(project) }

  it_behaves_like 'user reference or project reference'

  it 'ignores invalid projects' 


  it 'allows references with text after the > character' 


  %w(pre code a style).each do |elem|
    it "ignores valid references contained inside '#{elem}' element" 

  end

  it 'includes default classes' 


  context 'in group context' do
    let(:group) { create(:group) }
    let(:project) { create(:project, group: group) }

    let(:nested_group) { create(:group, :nested) }
    let(:nested_project) { create(:project, group: nested_group) }

    it 'supports mentioning a project' 


    it 'supports mentioning a project in a nested group' 

  end

  describe '#projects_hash' do
    it 'returns a Hash containing all Projects' 

  end

  describe '#projects' do
    it 'returns the projects mentioned in a document' 

  end
end

