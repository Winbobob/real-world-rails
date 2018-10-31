# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training/training_loader"
require "#{Rails.root}/lib/training_module"
require "#{Rails.root}/lib/training_library"

describe TrainingLoader do
  describe '#load_content' do
    before do
      allow(Features).to receive(:wiki_trainings?).and_return(true)
      no_yaml = "#{Rails.root}/training_content/none/*.yml"
      allow(TrainingSlide).to receive(:path_to_yaml).and_return(no_yaml)
      allow(TrainingModule).to receive(:path_to_yaml).and_return(no_yaml)
      allow(TrainingLibrary).to receive(:path_to_yaml).and_return(no_yaml)
    end

    let(:subject) do
      TrainingLoader.new(content_class: content_class, slug_whitelist: slug_whitelist)
    end
    let(:slug_whitelist) { nil }

    describe 'for basic slides' do
      let(:content_class) { TrainingSlide }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/slides-test')
      end

      context 'with no slug whitelist' do
        it 'returns an array of training content' 

      end

      context 'with a good slug whitelist' do
        # This slug needs to be linked on Meta:
        # https://meta.wikimedia.org/wiki/Training_modules/dashboard/slides-test
        let(:slug_whitelist) { ['using-media'] }
        it 'returns an array of just the whitelisted content' 

      end

      context 'with a bad slug whitelist' do
        let(:slug_whitelist) { ['this-is-not-a-slug-listed-on-meta'] }
        it 'raises an error' 

      end
    end

    describe 'for invalid content' do
      let(:content_class) { TrainingLibrary }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/libraries-invalid')
      end

      it 'logs a message and does not return the invalid content' 

    end

    describe 'for invalid base pages' do
      let(:content_class) { TrainingLibrary }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/does-not-exist')
      end
      it 'returns an empty collection' 

    end

    describe 'for slides with translations' do
      let(:content_class) { TrainingSlide }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/slides-example')
      end

      it 'imports slides with translated content' 

    end

    describe 'for modules' do
      let(:content_class) { TrainingModule }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/modules-test')
      end

      it 'returns an array of training content' 

    end

    describe 'for libraries' do
      let(:content_class) { TrainingLibrary }
      before do
        allow(content_class).to receive(:wiki_base_page)
          .and_return('Training modules/dashboard/libraries-test')
      end

      it 'returns an array of training content' 

    end
  end
end

