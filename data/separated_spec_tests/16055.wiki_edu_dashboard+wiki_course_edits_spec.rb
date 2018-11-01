# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/wiki_course_edits"

describe WikiCourseEdits do
  let(:course) { create(:course, id: 1, submitted: true, home_wiki_id: 1) }
  let(:user) { create(:user) }
  let(:enrolling_user) { create(:user, username: 'EnrollingUser') }

  before do
    stub_oauth_edit
  end

  describe '#update_course' do
    it 'edits a Wikipedia page representing a course' 


    it 'edits the course page with the delete option' 


    it 'reposts a clean version after hitting the spam filter' 

  end

  describe '#announce_course' do
    # Posts to the Wiki Education dashboard by default in tests
    it 'posts to the userpage of the instructor and a noticeboard' 


    context 'makes correct edits on the Wiki Education Dashboard' do
      it 'posts to dashboard using correct templates' 

    end

    context 'makes correct edits on P&E Outreach Dashboard' do
      before do
        @dashboard_url = ENV['dashboard_url']
        ENV['dashboard_url'] = 'outreachdashboard.wmflabs.org'
      end

      after do
        ENV['dashboard_url'] = @dashboard_url
      end

      context 'for enabled projects' do
        it 'posts to P&E Dashboard' 


        it 'posts to P&E Dashboard with correct template' 

      end

      context 'for disabled projects' do
        before { stub_wiki_validation }

        let(:wiki) { create(:wiki, language: 'pt', project: 'wikipedia') }
        let(:course) { create(:course, id: 1, submitted: true, home_wiki_id: wiki.id) }

        it 'does not post to P&E Dashboard' 

      end
    end
  end

  describe '#enroll_in_course' do
    # Posts to the Wiki Education dashboard by default in tests
    it 'posts to the userpage of the enrolling student and their sandbox' 


    context 'makes correct edits on P&E Outreach Dashboard' do
      unless Features.wiki_ed?
        before do
          @dashboard_url = ENV['dashboard_url']
          ENV['dashboard_url'] = 'outreachdashboard.wmflabs.org'
        end

        after do
          ENV['dashboard_url'] = @dashboard_url
        end

        context 'for enabled projects' do
          it 'posts to P&E Dashboard' 

        end

        context 'for disabled projects' do
          before { stub_wiki_validation }

          let(:wiki) { create(:wiki, language: 'pt', project: 'wikipedia') }
          let(:course) { create(:course, id: 1, submitted: true, home_wiki_id: wiki.id) }

          it 'does not post to P&E Dashboard' 

        end
      end
    end
  end

  describe '#update_assignments' do
    before { stub_wiki_validation }

    let(:selfie) { create(:article, title: 'Selfie') }
    let(:selfie_talk) { create(:article, title: 'Selfie', namespace: Article::Namespaces::TALK) }
    let(:redirect) { create(:article, title: 'Athletics_in_Epic_Poetry') }

    context 'when the course is not yet approved for a campaign' do
      it 'does not make assignment edits' 

    end

    context 'when the course is approved and in a campaign' do
      let(:campaign) { create(:campaign) }
      let!(:campaigns_course) do
        create(:campaigns_course, campaign_id: campaign.id, course_id: course.id)
      end

      context 'posts are made' do
        before do
          stub_raw_action
          allow_any_instance_of(WikiApi).to receive(:redirect?).and_return(false)
          create(:assignment,
                 user_id: user.id,
                 course_id: course.id,
                 article_title: 'Selfie',
                 article_id: selfie.id,
                 role: Assignment::Roles::ASSIGNED_ROLE)
          create(:assignment,
                 user_id: user.id,
                 course_id: course.id,
                 article_title: 'Talk:Selfie',
                 article_id: selfie_talk.id,
                 role: Assignment::Roles::REVIEWING_ROLE)
        end

        # Posts to the Wiki Education dashboard by default in tests
        it 'updates talk pages and course page with assignment info' 


        context 'makes correct edits on P&E Outreach Dashboard' do
          before do
            @dashboard_url = ENV['dashboard_url']
            ENV['dashboard_url'] = 'outreachdashboard.wmflabs.org'
          end

          after do
            ENV['dashboard_url'] = @dashboard_url
          end

          context 'for enabled projects' do
            it 'posts to P&E Dashboard' 

          end

          context 'for disabled projects' do
            let(:wiki) { Wiki.get_or_create(language: 'pt', project: 'wikipedia') }
            let(:course) { create(:course, submitted: true, home_wiki_id: wiki.id) }

            it 'does not post to P&E Dashboard' 

          end
        end
      end

      context 'posts are not made' do
        it 'does not post if page is a redirect' 


        it 'does not post if assignment has no article_id' 


        it 'does not post if assignment is an Available Article with no assigned user' 

      end
    end
  end

  context 'for course types that DO NOT make edits' do
    let(:visiting_scholarship) { create(:visiting_scholarship, submitted: true) }
    let(:editathon) { create(:editathon, submitted: true) }
    let(:legacy_course) { create(:legacy_course) }

    it 'returns immediately without making any edits' 

  end

  context 'for course types that DO make edits' do
    let(:basic_course) { create(:basic_course, submitted: true) }

    it 'makes edits' 

  end
end

