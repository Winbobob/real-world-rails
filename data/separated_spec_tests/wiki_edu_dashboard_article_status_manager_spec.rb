# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/article_status_manager"

describe ArticleStatusManager do
  before { stub_wiki_validation }
  let(:course) { create(:course, start: 1.year.ago, end: 1.year.from_now) }
  let(:user) { create(:user) }
  let!(:courses_user) { create(:courses_user, course: course, user: user) }

  describe '.update_article_status' do
    it 'runs without error' 

  end

  describe '.update_article_status_for_course' do
    it 'marks deleted articles as "deleted"' 


    it 'updates the mw_page_ids of articles' 


    it 'deletes articles when id changed but new one already exists' 


    it 'updates the namespace and titles when articles are moved' 


    it 'handles cases of space vs. underscore' 


    it 'handles case-variant titles' 


    it 'updates the mw_rev_id for revisions when article record changes' 


    it 'does not delete articles by mistake if Replica is down' 


    it 'does not delete articles by mistake if Replica goes right before trying to fetch titles' 


    it 'marks an undeleted article as not deleted' 

  end
end

