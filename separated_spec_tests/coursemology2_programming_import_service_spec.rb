# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Question::ProgrammingImportService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:question) { create(:course_assessment_question_programming, template_file_count: 0) }
    let(:package_path) do
      File.join(Rails.root, 'spec/fixtures/course/programming_question_template.zip')
    end
    let(:attachment) { create(:attachment_reference, binary: true, file_path: package_path) }
    subject { Course::Assessment::Question::ProgrammingImportService.new(question, attachment) }

    describe '.import' do
      subject { Course::Assessment::Question::ProgrammingImportService }
      it 'accepts attachments' 


      context 'when an invalid package is provided' do
        let(:package_path) do
          File.join(Rails.root, 'spec/fixtures/course/empty_programming_question_template.zip')
        end

        it 'raises an InvalidDataError' 

      end
    end

    describe '#import' do
      it 'imports the test cases' 


      it 'imports the template files' 


      context 'when the evaluation fails' do
        it 'raises an Course::Assessment::ProgrammingEvaluationService::Error' 

      end
    end

    describe '#save' do
      it 'does not trigger another attachment import' 

    end

    describe '#infer_test_case_type' do
      it 'infers that the test case is public' 


      it 'infers that the test case is private' 


      it 'infers that the test case is an evaluation test' 

    end
  end
end

