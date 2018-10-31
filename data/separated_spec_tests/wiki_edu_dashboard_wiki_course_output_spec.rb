# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wiki_course_output"

describe WikiCourseOutput do
  describe '.translate_course_to_wikitext' do
    it 'returns a wikitext version of the course' 


    context 'when the course has no weeks' do
      let(:course) { create(:course) }
      let(:subject) { WikiCourseOutput.new(course).translate_course_to_wikitext }

      it 'excludes the timeline for a course with no weeks' 

    end
  end
end

