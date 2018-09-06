# frozen_string_literal: true

require 'rails_helper'
# https://robots.thoughtbot.com/test-rake-tasks-like-a-boss

describe 'article:reset_articles_courses' do
  include_context 'rake'

  describe 'reset_articles_courses' do
    it 'calls Cleaners.remove_bad_articles_courses' 

  end

  describe 'rebuild_articles_courses' do
    it 'calls Cleaners.rebuild_articles_courses' 

  end

  describe 'import_assigned_articles' do
    it 'calls AssignedArticleImporter.import_articles_for_assignments' 

  end
end

