require 'spec_helper'

describe Banzai::Renderer do
  def fake_object(fresh:)
    object = double('object')

    allow(object).to receive(:respond_to?).with(:cached_markdown_fields).and_return(true)
    allow(object).to receive(:cached_html_up_to_date?).with(:field).and_return(fresh)
    allow(object).to receive(:cached_html_for).with(:field).and_return('field_html')

    object
  end

  describe '#render_field' do
    let(:renderer) { described_class }

    context 'without cache' do
      let(:commit) { create(:project, :repository).commit }

      it 'returns cacheless render field' 

    end

    context 'with cache' do
      subject { renderer.render_field(object, :field) }

      context 'with a stale cache' do
        let(:object) { fake_object(fresh: false) }

        it 'caches and returns the result' 


        it "skips database caching on a GitLab read-only instance" 

      end

      context 'with an up-to-date cache' do
        let(:object) { fake_object(fresh: true) }

        it 'uses the cache' 

      end
    end
  end
end

