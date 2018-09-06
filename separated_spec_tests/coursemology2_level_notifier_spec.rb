# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::LevelNotifier, type: :notifier do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    describe '#level_reached' do
      let(:course) { create(:course) }
      let(:level) { create(:course_level, course: course) }
      let(:user) { create(:course_user, course: course).user }

      subject { Course::LevelNotifier.level_reached(user, level) }

      it 'sends a course notification' 


      it 'sends a user notification' 

    end
  end
end

