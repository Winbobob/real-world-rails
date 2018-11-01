# frozen_string_literal: true

require 'rails_helper'

describe QuestionGroupsHelper, type: :helper do
  describe '#course_meets_conditions_for_question_group?' do
    before do
      @tag = create(:tag, tag: 'pizza')
      @campaign = create(:campaign)
      @survey = build_stubbed(:survey)
      @survey_assignment = build_stubbed(:survey_assignment, survey_id: @survey)
    end

    it 'returns true it question_group has no tags or campaigns' 


    it 'returns true if question_group tags match course tags' 


    it 'returns false if question_group tags don\'t match course tags' 


    it 'returns true if question_group campaigns match course campaigns' 


    it 'returns false if question_group campaigns don\'t match course campaigns' 


    it 'returns true if question_group campaigns and tags match those of the course' 

  end
end

