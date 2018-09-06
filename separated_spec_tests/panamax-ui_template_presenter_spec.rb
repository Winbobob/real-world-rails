require 'spec_helper'

describe TemplatePresenter do
  let(:fake_template) do
    double(:fake_template,
      id: 99,
      name: 'boom shaka',
      description: 'goes boom shaka laka',
      short_description: 'goes boom',
      last_updated_on: 'Mon',
      image_count: 5,
      image_count_label: 'Images',
      icon_src: '/icons/icon.png'
    )
  end

  subject { TemplatePresenter.new(fake_template) }

  describe '#id' do
    it 'exposes the template id' 

  end

  describe '#title' do
    it 'exposes the template name' 

  end

  describe '#short_description' do
    it 'exposes the template short description' 

  end

  describe '#description' do
    it 'exposes the template description' 

  end

  describe '#last_updated_on' do
    it 'exposes the template last_updated_on' 

  end

  describe '#image_count' do
    it 'exposes the template image_count' 

  end

  describe '#image_count_label' do
    it 'exposes the template image_count_label' 

  end

  describe '#icon_src' do
    it 'exposes the icon_src src' 

  end
end

