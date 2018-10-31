# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/training_library"
require "#{Rails.root}/lib/training_module"

describe TrainingBase do
  before do
    allow(Features).to receive(:wiki_trainings?).and_return(false)
  end

  after(:all) do
    TrainingModule.flush
    TrainingLibrary.flush
  end

  describe 'abstract parent class' do
    it 'raises errors for required template instance methods' 


    it 'raises errors for required template class methods' 

  end

  describe '.load' do
    let(:subject) { TrainingModule.load }

    context 'when a module file is misformatted' do
      before do
        allow(described_class).to receive(:base_path)
          .and_return("#{Rails.root}/spec/support/bad_yaml")
      end

      it 'raises an error and outputs the filename the bad file' 

    end

    context 'when a slide file is misformatted' do
      let(:subject) { TrainingSlide.load }

      before do
        allow(described_class).to receive(:base_path)
          .and_return("#{Rails.root}/spec/support/bad_yaml_slide")
      end

      it 'raises an error that includes the filename of the bad file' 

    end

    context 'when there are duplicate slugs' do
      before do
        allow(TrainingModule).to receive(:trim_id_from_filename).and_return(true)
        allow(described_class).to receive(:base_path)
          .and_return("#{Rails.root}/spec/support/duplicate_yaml_slugs")
      end

      it 'raises an error noting the duplicate slug name' 

    end

    context 'when there are duplicate ids' do
      before do
        allow(described_class).to receive(:base_path)
          .and_return("#{Rails.root}/spec/support/duplicate_yaml_ids")
      end

      it 'raises an error noting the duplicate id' 

    end

    context 'when training_path is set' do
      before do
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:[]).with('training_path').and_return('training_content/wiki_ed')
      end

      it 'loads trainings from that path' 

    end

    context 'when training_path not is set' do
      before do
        allow(ENV).to receive(:[]).and_call_original
        allow(ENV).to receive(:[]).with('training_path').and_return(nil)
      end

      it 'loads trainings from the default path' 

    end
  end

  describe '.all' do
    context 'when the cache is empty' do
      before do
        TrainingLibrary.flush
        TrainingModule.flush
      end

      it 'loads from yaml files' 

    end
  end

  describe '.load_all' do
    context 'with wiki trainings disabled' do
      before do
        allow(Features).to receive(:wiki_trainings?).and_return(false)
      end

      it 'sets wiki_slide to nil for training content' 

    end

    context 'with wiki trainings enabled' do
      before do
        TrainingSlide.destroy_all
        allow(Features).to receive(:wiki_trainings?).and_return(true)
      end

      it 'loads libraries, modules and slides that include the source wiki_page' 

    end
  end

  # Make sure default trainings get reloaded
end

