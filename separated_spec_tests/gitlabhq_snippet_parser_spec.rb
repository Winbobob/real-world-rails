require 'spec_helper'

describe Banzai::ReferenceParser::SnippetParser do
  include ReferenceParserHelpers

  let(:project) { create(:project, :public) }

  let(:user) { create(:user) }
  let(:external_user) { create(:user, :external) }
  let(:project_member) { create(:user) }

  subject { described_class.new(Banzai::RenderContext.new(project, user)) }
  let(:link) { empty_html_link }

  def visible_references(snippet_visibility, user = nil)
    snippet = create(:project_snippet, snippet_visibility, project: project)
    link['data-project'] = project.id.to_s
    link['data-snippet'] = snippet.id.to_s

    subject.nodes_visible_to_user(user, [link])
  end

  before do
    project.add_user(project_member, :developer)
  end

  describe '#nodes_visible_to_user' do
    context 'when a project is public and the snippets feature is enabled for everyone' do
      before do
        project.project_feature.update_attribute(:snippets_access_level, ProjectFeature::ENABLED)
      end

      it 'creates a reference for guest for a public snippet' 


      it 'creates a reference for a regular user for a public snippet' 


      it 'creates a reference for a regular user for an internal snippet' 


      it 'does not create a reference for an external user for an internal snippet' 


      it 'creates a reference for a project member for a private snippet' 


      it 'does not create a reference for a regular user for a private snippet' 

    end

    context 'when a project is public and the snippets feature is enabled for project team members' do
      before do
        project.project_feature.update_attribute(:snippets_access_level, ProjectFeature::PRIVATE)
      end

      it 'creates a reference for a project member for a public snippet' 


      it 'does not create a reference for guest for a public snippet' 


      it 'does not create a reference for a regular user for a public snippet' 


      it 'creates a reference for a project member for an internal snippet' 


      it 'does not create a reference for a regular user for an internal snippet' 


      it 'creates a reference for a project member for a private snippet' 


      it 'does not create a reference for a regular user for a private snippet' 

    end

    context 'when a project is internal and the snippets feature is enabled for everyone' do
      before do
        project.update_attribute(:visibility, Gitlab::VisibilityLevel::INTERNAL)
        project.project_feature.update_attribute(:snippets_access_level, ProjectFeature::ENABLED)
      end

      it 'does not create a reference for guest for a public snippet' 


      it 'does not create a reference for an external user for a public snippet' 


      it 'creates a reference for a regular user for a public snippet' 


      it 'creates a reference for a regular user for an internal snippet' 


      it 'does not create a reference for an external user for an internal snippet' 


      it 'creates a reference for a project member for a private snippet' 


      it 'does not create a reference for a regular user for a private snippet' 

    end

    context 'when a project is internal and the snippets feature is enabled for project team members' do
      before do
        project.update_attribute(:visibility, Gitlab::VisibilityLevel::INTERNAL)
        project.project_feature.update_attribute(:snippets_access_level, ProjectFeature::PRIVATE)
      end

      it 'creates a reference for a project member for a public snippet' 


      it 'does not create a reference for guest for a public snippet' 


      it 'does not create reference for a regular user for a public snippet' 


      it 'creates a reference for a project member for an internal snippet' 


      it 'does not create a reference for a regular user for an internal snippet' 


      it 'creates a reference for a project member for a private snippet' 


      it 'does not create reference for a regular user for a private snippet' 

    end

    context 'when a project is private and the snippets feature is enabled for project team members' do
      before do
        project.update_attribute(:visibility, Gitlab::VisibilityLevel::PRIVATE)
        project.project_feature.update_attribute(:snippets_access_level, ProjectFeature::PRIVATE)
      end

      it 'creates a reference for a project member for a public snippet' 


      it 'does not create a reference for guest for a public snippet' 


      it 'does not create a reference for a regular user for a public snippet' 


      it 'creates a reference for a project member for an internal snippet' 


      it 'does not create a reference for a regular user for an internal snippet' 


      it 'creates a reference for a project member for a private snippet' 


      it 'does not create a reference for a regular user for a private snippet' 

    end
  end

  describe '#referenced_by' do
    let(:snippet) { create(:snippet, project: project) }
    describe 'when the link has a data-snippet attribute' do
      context 'using an existing snippet ID' do
        it 'returns an Array of snippets' 

      end

      context 'using a non-existing snippet ID' do
        it 'returns an empty Array' 

      end
    end
  end
end

