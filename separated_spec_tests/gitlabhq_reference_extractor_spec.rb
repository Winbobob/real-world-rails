require 'spec_helper'

describe Gitlab::ReferenceExtractor do
  let(:project) { create(:project) }

  before do
    project.add_developer(project.creator)
  end

  subject { described_class.new(project, project.creator) }

  it 'accesses valid user objects' 


  it 'ignores user mentions inside specific elements' 


  describe 'directly addressed users' do
    before do
      @u_foo  = create(:user, username: 'foo')
      @u_foo2 = create(:user, username: 'foo2')
      @u_foo3 = create(:user, username: 'foo3')
      @u_foo4 = create(:user, username: 'foo4')
      @u_foo5 = create(:user, username: 'foo5')

      @u_bar  = create(:user, username: 'bar')
      @u_bar2 = create(:user, username: 'bar2')
      @u_bar3 = create(:user, username: 'bar3')
      @u_bar4 = create(:user, username: 'bar4')

      @u_tom  = create(:user, username: 'tom')
      @u_tom2 = create(:user, username: 'tom2')
    end

    context 'when a user is directly addressed' do
      it 'accesses the user object which is mentioned in the beginning of the line' 


      it "doesn't access the user object if it's not mentioned in the beginning of the line" 

    end

    context 'when multiple users are addressed' do
      it 'accesses the user objects which are mentioned in the beginning of the line' 


      it "doesn't access the user objects if they are not mentioned in the beginning of the line" 

    end

    context 'when multiple users are addressed in different paragraphs' do
      it 'accesses user objects which are mentioned in the beginning of each paragraph' 

    end
  end

  it 'does not include anchors from table of contents in issue references' 


  it 'accesses valid issue objects' 


  it 'accesses valid merge requests' 


  it 'accesses valid labels' 


  it 'accesses valid snippets' 


  it 'accesses valid commits' 


  it 'accesses valid commit ranges' 


  context 'with an external issue tracker' do
    let(:project) { create(:jira_project) }
    let(:issue)   { create(:issue, project: project) }

    context 'when GitLab issues are enabled' do
      it 'returns both JIRA and internal issues' 


      it 'returns only JIRA issues if the internal one does not exists' 

    end

    context 'when GitLab issues are disabled' do
      before do
        project.issues_enabled = false
        project.save!
      end

      it 'returns only JIRA issues' 

    end
  end

  context 'with a project with an underscore' do
    let(:other_project) { create(:project, path: 'test_project') }
    let(:issue) { create(:issue, project: other_project) }

    before do
      other_project.add_developer(project.creator)
    end

    it 'handles project issue references' 

  end

  describe '#all' do
    let(:issue) { create(:issue, project: project) }
    let(:label) { create(:label, project: project) }
    let(:text) { "Ref. #{issue.to_reference} and #{label.to_reference}" }

    before do
      project.add_developer(project.creator)
      subject.analyze(text)
    end

    it 'returns all referables' 

  end

  describe '.references_pattern' do
    subject { described_class.references_pattern }
    it { is_expected.to be_kind_of Regexp }
  end

  describe 'referables prefixes' do
    def prefixes
      described_class::REFERABLES.each_with_object({}) do |referable, result|
        klass = referable.to_s.camelize.constantize

        next unless klass.respond_to?(:reference_prefix)

        prefix = klass.reference_prefix
        result[prefix] ||= []
        result[prefix] << referable
      end
    end

    it 'returns all supported prefixes' 


    it 'does not allow one prefix for multiple referables if not allowed specificly' 

  end
end

