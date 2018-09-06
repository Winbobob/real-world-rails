# frozen_string_literal: true

require 'rails_helper'

describe 'email links for Fall 2017 CMU experiment', type: :feature do
  let(:admin) { create(:admin) }
  let(:email_code) { 'abcdefgabcdefg' }
  let(:course) do
    create(:course, flags: { fall_2017_cmu_experiment: 'email_sent',
                             fall_2017_cmu_experiment_email_code: email_code })
  end
  let(:campaign) { create(:campaign, slug: 'fall_2017') }

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

    it 'sends a csv of all fall 2017 courses with their experiment status' 

  end
end

