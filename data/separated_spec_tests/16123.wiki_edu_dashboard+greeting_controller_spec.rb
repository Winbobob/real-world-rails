# frozen_string_literal: true

require 'rails_helper'

describe GreetingController do
  subject { put :greet_course_students, params: { course_id: course.id } }

  let(:admin) { create(:admin) }
  let(:course) { create(:course) }

  before { allow(controller).to receive(:current_user).and_return(admin) }

  it 'greets ungreeted students' 

end

