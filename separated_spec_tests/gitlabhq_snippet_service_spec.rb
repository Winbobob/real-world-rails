require 'spec_helper'

describe Search::SnippetService do
  let(:author) { create(:author) }
  let(:project) { create(:project, :public) }

  let!(:public_snippet)   { create(:snippet, :public, content: 'password: XXX') }
  let!(:internal_snippet) { create(:snippet, :internal, content: 'password: XXX') }
  let!(:private_snippet)  { create(:snippet, :private, content: 'password: XXX', author: author) }

  let!(:project_public_snippet)   { create(:snippet, :public, project: project, content: 'password: XXX') }
  let!(:project_internal_snippet) { create(:snippet, :internal, project: project, content: 'password: XXX') }
  let!(:project_private_snippet)  { create(:snippet, :private, project: project, content: 'password: XXX') }

  describe '#execute' do
    context 'unauthenticated' do
      it 'returns public snippets only' 

    end

    context 'authenticated' do
      it 'returns only public & internal snippets for regular users' 


      it 'returns public, internal snippets and project private snippets for project members' 


      it 'returns public, internal and private snippets where user is the author' 


      it 'returns all snippets when user is admin' 

    end
  end
end

