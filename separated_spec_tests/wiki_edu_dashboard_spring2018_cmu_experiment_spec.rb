# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/app/controllers/experiments/spring2018_cmu_experiment_controller"

describe 'email links for Spring 2018 CMU experiment', type: :feature do
  let(:admin) { create(:admin) }
  let(:email_code) { 'abcdefgabcdefg' }
  let(:course) do
    create(:course, flags: { spring_2018_cmu_experiment: 'email_sent',
                             spring_2018_cmu_experiment_email_code: email_code })
  end
  let(:campaign) { create(:campaign, slug: 'spring_2018') }

  describe '#opt_in' do
    it 'updates the course experiment status' 


    it 'errors if email_code is wrong' 

  end

  describe '#opt_out' do
    it 'updates the course experiment status' 


    it 'errors if email_code is wrong' 

  end

  describe '#course_list' do
    before { course.campaigns << campaign }

    it 'sends a csv of all spring 2018 courses with their experiment status' 

  end
end

