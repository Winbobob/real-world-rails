# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/surveys/survey_test_email_manager"

describe SurveyTestEmailManager do
  describe '.send_test_email' do
    let(:user) { create(:user) }
    let(:survey) { create(:survey) }
    let!(:course) { create(:course) }
    let(:survey_assignment) do
      create(:survey_assignment, survey_id: survey.id,
                                 email_template: SurveyMailer::TEMPLATES[0])
    end

    it 'sends an email to the user who clicks' 

  end
end

