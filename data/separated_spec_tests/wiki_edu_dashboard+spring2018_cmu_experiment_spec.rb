# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/experiments/spring2018_cmu_experiment"

describe Spring2018CmuExperiment do
  let(:spring_2018) { create(:campaign, slug: 'spring_2018') }
  let(:user) { create(:user, email: 'sage@example.com') }

  before do
    4.times do |i|
      course = create(:course, slug: "spring course number #{i}", id: i)
      course.campaigns << spring_2018
      create(:courses_user, course: course, user: user,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    end
  end

  let(:block) do
    create(
      :block,
      week: week,
      title: 'Get started on Wikipedia',
      training_module_ids: [1, 2]
    )
  end
  let(:week) { create(:week, course: course) }
  let(:course) { create(:course, flags: { Spring2018CmuExperiment::STATUS_KEY => 'email_sent' }) }

  describe '.process_courses' do
    it 'divides courses between experiment and control, and updates experiment setting' 


    context 'when invitations get no response for a week' do
      after { Timecop.return }

      it 'sends reminders for courses that have not responded' 

    end
  end

  describe '#opt_in and #opt_out' do
    it 'updates the experiment status of a course to opted_in and adds trainings to timeline' 

  end

  describe '#opt_out' do
    it 'updates the experiment status of a course to opted_out' 

  end
end

