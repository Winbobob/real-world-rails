require 'spec_helper'

describe Banzai::ObjectRenderer do
  let(:project) { create(:project, :repository) }
  let(:user) { project.owner }
  let(:renderer) do
    described_class.new(
      default_project: project,
      user: user,
      redaction_context: { custom_value: 'value' }
    )
  end

  let(:object) { Note.new(note: 'hello', note_html: '<p dir="auto">hello</p>', cached_markdown_version: CacheMarkdownField::CACHE_COMMONMARK_VERSION) }

  describe '#render' do
    context 'with cache' do
      it 'renders and redacts an Array of objects' 


      it 'calls Banzai::Redactor to perform redaction' 


      it 'retrieves field content using Banzai::Renderer.render_field' 


      it 'passes context to PostProcessPipeline' 

    end

    context 'without cache' do
      let(:commit) { project.commit }

      it 'renders and redacts an Array of objects' 


      it 'calls Banzai::Redactor to perform redaction' 


      it 'retrieves field content using Banzai::Renderer.cacheless_render_field' 

    end
  end
end

