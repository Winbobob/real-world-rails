require 'spec_helper'

describe Banzai::Redactor do
  let(:user) { create(:user) }
  let(:project) { build(:project) }
  let(:redactor) { described_class.new(Banzai::RenderContext.new(project, user)) }

  describe '#redact' do
    context 'when reference not visible to user' do
      before do
        expect(redactor).to receive(:nodes_visible_to_user).and_return([])
      end

      it 'redacts an array of documents' 


      it 'replaces redacted reference with inner HTML' 


      context 'when data-original attribute provided' do
        let(:original_content) { '<code>foo</code>' }
        it 'replaces redacted reference with original content' 

      end

      it 'returns <a> tag with original href if it is originally a link reference' 

    end

    context 'when project is in pending delete' do
      let!(:issue) { create(:issue, project: project) }
      let(:redactor) { described_class.new(Banzai::RenderContext.new(project, user)) }

      before do
        project.update(pending_delete: true)
      end

      it 'redacts an issue attached' 


      it 'redacts an external issue' 

    end

    context 'when reference visible to user' do
      it 'does not redact an array of documents' 

    end
  end

  context 'when the user cannot read cross project' do
    include ActionView::Helpers::UrlHelper
    let(:project) { create(:project) }
    let(:other_project) { create(:project, :public) }

    def create_link(issuable)
      type = issuable.class.name.underscore.downcase
      link_to(issuable.to_reference, '',
              class: 'gfm has-tooltip',
              title: issuable.title,
              data: {
                reference_type: type,
                "#{type}": issuable.id
              })
    end

    before do
      project.add_developer(user)

      allow(Ability).to receive(:allowed?).and_call_original
      allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global) { false }
      allow(Ability).to receive(:allowed?).with(user, :read_cross_project) { false }
    end

    it 'skips links to issues within the same project' 


    it 'removes info from a cross project reference' 

  end

  describe '#redact_nodes' do
    it 'redacts an Array of nodes' 

  end

  describe '#nodes_visible_to_user' do
    it 'returns a Set containing the visible nodes' 

  end
end

