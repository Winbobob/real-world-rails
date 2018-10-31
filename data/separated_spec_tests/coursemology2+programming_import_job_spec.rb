# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Assessment::Question::ProgrammingImportJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    subject { Course::Assessment::Question::ProgrammingImportJob }
    let(:question) do
      create(:course_assessment_question_programming, template_file_count: 0)
    end
    let(:attachment) do
      create(:attachment_reference,
             file_path:
               File.join(Rails.root, 'spec/fixtures/course/programming_question_template.zip'),
             binary: true)
    end

    it 'can be queued' 


    it 'imports the templates' 


    it 'imports the test cases' 

  end
end

