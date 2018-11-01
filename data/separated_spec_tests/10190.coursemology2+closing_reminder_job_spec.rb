# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Survey::ClosingReminderJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let(:survey) { create(:survey) }

    context 'when end_at of the survey is changed' do
      it 'creates a closing reminder job' 


      context 'when end_at is a past time' do
        it 'does not do anything' 

      end
    end
  end
end

