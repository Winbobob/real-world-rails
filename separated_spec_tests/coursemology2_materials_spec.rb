# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Extension: Materials' do
  class self::Assessment < ApplicationRecord
    def self.columns
      []
    end

    def self.load_schema!; end

    has_one_folder
  end

  describe self::Assessment, type: :model do
    it { is_expected.to have_one(:folder).autosave(true) }
    it { is_expected.to have_many(:materials) }

    let(:file) { 'file.txt' }
    let(:files) do
      [
        OpenStruct.new(original_filename: file,
                       tempfile: Rails.root.join('spec/fixtures/files/text.txt'))
      ]
    end
    let(:assessment) { self.class::Assessment.new(assessment_attributes) }
    let(:assessment_attributes) { nil }

    describe 'callbacks' do
      describe 'after the assessment is initialized' do
        it 'has a folder' 

      end
    end

    describe '#initialize' do
      let(:assessment_attributes) { { files_attributes: files } }
      it 'allows direct assignment to files' 

    end

    describe '#files_attributes=' do
      it 'creates materials from files' 


      context 'when filename is not valid' do
        let(:file) { 'lol\lol.txt' }

        it 'normalizes the name' 

      end
    end
  end

  describe 'controller' do
    class self::AssessmentsController < ActionController::Base; end

    let(:controller) { self.class::AssessmentsController.new }
    subject { controller }
    it { is_expected.to respond_to(:folder_params) }

    describe '#folder_params' do
      it 'returns the permitted params' 

    end
  end

  describe 'form_builder helper' do
    class self::AssessmentView < ActionView::Base; end
    class self::FormBuilder < ActionView::Helpers::FormBuilder; end

    let(:template) { self.class::AssessmentView.new(Rails.root.join('app', 'views')) }
    let(:resource) do
      assessment = self.class::Assessment.new
      assessment.build_folder
      assessment
    end
    let(:form_builder) { self.class::FormBuilder.new(:form_builder, resource, template, {}) }
    subject { form_builder }

    it { is_expected.to respond_to(:folder) }

    describe '#folder' do
      subject { form_builder.folder }

      it do
        is_expected.
          to have_tag('input[type=file]')
      end
    end
  end
end

