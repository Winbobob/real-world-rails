# frozen_string_literal: true

require 'rails_helper'

describe SurveyNotificationsController do
  describe '#update' do
    let(:survey_notification) { create(:survey_notification) }
    let(:params) do
      { survey_notification: { id: survey_notification.id, dismissed: true, completed: false } }
    end

    it 'renders a success message if update succeeds' 


    it 'renders an error message if update fails' 

  end
end

