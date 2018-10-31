require 'spec_helper'

describe ImagePresenter do

  let(:fake_image) do
    double(:fake_image,
      registry_id: 7,
      source: 'boom/shaka',
      tags: ['foo', 'bar'],
      description: 'goes boom shaka laka',
      short_description: 'goes boom',
      status_label: 'Local',
      badge_class: 'local',
      star_count: 123,
      docker_index_url: "#{DOCKER_INDEX_BASE_URL}boom/shaka",
      imagelayers_url: "#{IMAGELAYERS_URL}?images=boom/shaka"
    )
  end

  let(:view_context) { ActionView::Base.new }

  subject { ImagePresenter.new(fake_image, view_context) }

  describe '#title' do
    it 'exposes the image repository' 

  end

  describe '#registry_id' do
    it 'exposes the image registry_id' 

  end

  describe '#description' do
    it 'exposes the image description' 

  end

  describe '#status_label' do
    it 'exposes the image status label' 

  end

  describe '#badge_class' do
    it 'exposes the image badge_class' 

  end

  describe '#star_count' do
    it 'exposes the star count' 

  end

  describe '#docker_index_url' do
    it 'exposes the docker index url' 

  end

  describe '#imagelayers_url' do
    it 'exposes the imagelayers url' 

  end

  describe '#tag_options' do
    it 'returns a set of HTML options for each tag' 

  end
end

