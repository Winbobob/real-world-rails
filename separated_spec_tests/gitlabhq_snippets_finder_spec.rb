require 'spec_helper'

describe SnippetsFinder do
  include Gitlab::Allowable
  using RSpec::Parameterized::TableSyntax

  context 'filter by visibility' do
    let!(:snippet1) { create(:personal_snippet, :private) }
    let!(:snippet2) { create(:personal_snippet, :internal) }
    let!(:snippet3) { create(:personal_snippet, :public) }

    it "returns public snippets when visibility is PUBLIC" 

  end

  context 'filter by scope' do
    let(:user) { create :user }
    let!(:snippet1) { create(:personal_snippet, :private, author: user) }
    let!(:snippet2) { create(:personal_snippet, :internal, author: user) }
    let!(:snippet3) { create(:personal_snippet, :public, author: user) }

    it "returns all snippets for 'all' scope" 


    it "returns all snippets for 'are_private' scope" 


    it "returns all snippets for 'are_internal' scope" 


    it "returns all snippets for 'are_private' scope" 

  end

  context 'filter by author' do
    let(:user) { create :user }
    let(:user1) { create :user }
    let!(:snippet1) { create(:personal_snippet, :private, author: user) }
    let!(:snippet2) { create(:personal_snippet, :internal, author: user) }
    let!(:snippet3) { create(:personal_snippet, :public, author: user) }

    it "returns all public and internal snippets" 


    it "returns internal snippets" 


    it "returns private snippets" 


    it "returns public snippets" 


    it "returns all snippets" 


    it "returns only public snippets if unauthenticated user" 

  end

  context 'filter by project' do
    let(:user) { create :user }
    let(:group) { create :group, :public }
    let(:project1) { create(:project, :public,  group: group) }

    before do
      @snippet1 = create(:project_snippet, :private,  project: project1)
      @snippet2 = create(:project_snippet, :internal, project: project1)
      @snippet3 = create(:project_snippet, :public,   project: project1)
    end

    it "returns public snippets for unauthorized user" 


    it "returns public and internal snippets for non project members" 


    it "returns public snippets for non project members" 


    it "returns internal snippets for non project members" 


    it "does not return private snippets for non project members" 


    it "returns all snippets for project members" 


    it "returns private snippets for project members" 

  end

  describe '#execute' do
    let(:project) { create(:project, :public) }
    let!(:project_snippet) { create(:project_snippet, :public, project: project) }
    let!(:personal_snippet) { create(:personal_snippet, :public) }
    let(:user) { create(:user) }
    subject(:finder) { described_class.new(user) }

    it 'returns project- and personal snippets' 


    context 'when the user cannot read cross project' do
      before do
        allow(Ability).to receive(:allowed?).and_call_original
        allow(Ability).to receive(:allowed?).with(user, :read_cross_project) { false }
      end

      it 'returns only personal snippets when the user cannot read cross project' 

    end
  end
end

