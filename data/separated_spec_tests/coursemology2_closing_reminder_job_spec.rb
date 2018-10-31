# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Video::ClosingReminderJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let!(:video) { create(:video) }

    context 'when end_at is changed' do
      it 'creates a closing reminder job' 


      context 'when end_at is a past time' do
        it 'does not do create any jobs' 

      end
    end
  end
end

