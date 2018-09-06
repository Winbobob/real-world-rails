# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::DuplicationJob do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    let!(:course) { create(:course) }
    let(:user) { create(:course_manager, course: course).user }
    subject { Course::DuplicationJob }

    it 'can be queued' 


    it 'duplicates the course' 

  end
end

