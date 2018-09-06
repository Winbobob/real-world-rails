require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../rubocop/cop/project_path_helper'

describe RuboCop::Cop::ProjectPathHelper do
  include CopHelper

  subject(:cop) { described_class.new }

  context "when using namespace_project with the project's namespace" do
    let(:source) { 'edit_namespace_project_issue_path(@issue.project.namespace, @issue.project, @issue)' }
    let(:correct_source) { 'edit_project_issue_path(@issue.project, @issue)' }

    it 'registers an offense' 


    it 'autocorrects to the right version' 

  end

  context 'when using namespace_project with a different namespace' do
    it 'registers no offense' 

  end
end

