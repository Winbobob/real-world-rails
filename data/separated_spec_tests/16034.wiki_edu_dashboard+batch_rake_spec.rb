# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/data_cycle/constant_update"
require "#{Rails.root}/lib/data_cycle/schedule_course_updates"
require "#{Rails.root}/lib/data_cycle/daily_update"
require "#{Rails.root}/lib/data_cycle/survey_update"

# https://robots.thoughtbot.com/test-rake-tasks-like-a-boss

describe 'batch:update_constantly' do
  include_context 'rake'

  describe 'update_constantly' do
    it 'initializes a ConstantUpdate' 

  end

  describe 'schedule_course_updates' do
    it 'initializes a ShortUpdate' 

  end

  describe 'update_daily' do
    it 'initializes a DailyUpdate' 

  end

  describe 'survey_update' do
    it 'initializes a SurveyUpdate' 

  end

  describe 'pause' do
    it 'creates a pause file' 

  end

  describe 'resume' do
    it 'deletes a pause file' 

  end
end

