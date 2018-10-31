# frozen_string_literal: true

require 'rails_helper'

describe CampaignsController do
  render_views

  describe '#index' do
    it 'renders a 200' 

  end

  describe '#create' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:title) { 'My New? Campaign 5!' }
    let(:expected_slug) { 'my_new_campaign_5' }
    let(:campaign_params) do
      { campaign: { title: title,
                    default_passcode: 'custom',
                    custom_default_passcode: 'ohai' } }
    end

    context 'when user is an admin' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
      end

      it 'creates new campaigns with custom passcodes' 


      it 'creates a campaign user for the current user' 


      it 'does not create duplicate titles' 


      it 'does not create duplicate slugs' 

    end

    context 'when user is not an admin and feature flag is off' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(Features).to receive(:open_course_creation?).and_return(false)
      end

      it 'returns a 401 and does not create a campaign' 

    end
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:campaign) { create(:campaign) }
    let(:description) { 'My new campaign is the best campaign ever!' }
    let(:campaign_params) { { slug: campaign.slug, description: description } }

    it 'returns a 401 if the user is not an admin and not an organizer of the campaign' 


    it 'updates the campaign if the user is an organizer of the campaign' 


    it 'updates the campaign if the user is an admin' 

  end

  describe '#destroy' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:campaign) { create(:campaign) }

    it 'returns a 401 if the user is not an admin and not an organizer of the campaign' 


    it 'deletes the campaign if the user is a campaign organizer' 

  end

  describe '#add_organizer' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:campaign) { create(:campaign) }

    it 'returns a 401 if the user is not an admin and not an organizer of the campaign' 


    it 'adds the given user as an organizer of the campaign '\
       'if the current user is a campaign organizer' do
      create(:campaigns_user, user_id: user.id, campaign_id: campaign.id,
                              role: CampaignsUsers::Roles::ORGANIZER_ROLE)
      user2 = create(:user, username: 'MusikAnimal')
      allow(controller).to receive(:current_user).and_return(user)
      put :add_organizer, params: { slug: campaign.slug, username: user2.username }
      expect(response.status).to eq(302) # redirect to /overview
      expect(CampaignsUsers.last.user_id).to eq(user2.id)
    end
  end

  describe '#remove_organizer' do
    let(:user) { create(:user) }
    let(:user2) { create(:user, username: 'user2') }
    let(:campaign) { create(:campaign) }
    let(:organizer) do
      create(:campaigns_user, user_id: user2.id, campaign_id: campaign.id,
                              role: CampaignsUsers::Roles::ORGANIZER_ROLE)
    end

    it 'returns a 401 if the user is not an admin and not an organizer of the campaign' 


    it 'removes the given organizer from the campaign '\
       'if the current user is a campaign organizer' do
      create(:campaigns_user, user_id: user.id, campaign_id: campaign.id,
                              role: CampaignsUsers::Roles::ORGANIZER_ROLE)
      allow(controller).to receive(:current_user).and_return(user)
      put :remove_organizer, params: { slug: campaign.slug, id: organizer.user_id }
      expect(response.status).to eq(302) # redirect to /overview
      expect(CampaignsUsers.find_by(id: organizer.id)).to be_nil
    end
  end

  describe '#remove_course' do
    let(:user) { create(:user) }
    let(:campaign) { create(:campaign) }
    let(:course) { create(:course) }
    let!(:campaigns_course) do
      create(:campaigns_course, campaign_id: campaign.id,
                                course_id: course.id)
    end

    it 'returns a 401 if the user is not an admin and not an organizer of the campaign' 


    it 'removes the course from the campaign if the current user is a campaign organizer' 

  end

  describe '#students' do
    let(:course) { create(:course) }
    let(:campaign) { create(:campaign) }
    let(:student) { create(:user) }

    before do
      campaign.courses << course
      create(:courses_user, course_id: course.id, user_id: student.id,
                            role: CoursesUsers::Roles::STUDENT_ROLE)
    end

    context 'without "course" option' do
      let(:request_params) { { slug: campaign.slug, format: :csv } }

      it 'returns a csv of student usernames' 

    end

    context 'with "course" option' do
      let(:request_params) { { slug: campaign.slug, course: true, format: :csv } }

      it 'returns a csv of student usernames with course slugs' 

    end
  end

  describe '#instructors' do
    let(:course) { create(:course) }
    let(:campaign) { create(:campaign) }
    let(:instructor) { create(:user) }

    before do
      campaign.courses << course
      create(:courses_user, course_id: course.id, user_id: instructor.id,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    end

    context 'without "course" option' do
      let(:request_params) { { slug: campaign.slug, format: :csv } }

      it 'returns a csv of instructor usernames' 

    end

    context 'with "course" option' do
      let(:request_params) { { slug: campaign.slug, course: true, format: :csv } }

      it 'returns a csv of instructor usernames with course slugs' 

    end
  end

  describe '#courses' do
    let(:course) { create(:course, user_count: 1) }
    let(:campaign) { create(:campaign) }
    let(:instructor) { create(:user) }
    let(:request_params) { { slug: campaign.slug, format: :csv } }

    before do
      campaign.courses << course
      create(:courses_user, course_id: course.id, user_id: instructor.id,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    end
    it 'returns a csv of course data' 

  end

  describe '#articles_csv' do
    let(:course) { create(:course) }
    let(:campaign) { create(:campaign) }
    let(:article) { create(:article) }
    let(:user) { create(:user) }
    let!(:revision) { create(:revision, article: article, user: user, date: course.start + 1.hour) }
    let(:request_params) { { slug: campaign.slug, format: :csv } }

    before do
      campaign.courses << course
      create(:courses_user, course: course, user: user)
    end
    it 'returns a csv of course data' 

  end

  describe '#overview' do
    render_views
    let(:user) { create(:user) }
    let(:campaign) { create(:campaign) }

    before do
      create(:campaigns_user, user_id: user.id, campaign_id: campaign.id,
                              role: CampaignsUsers::Roles::ORGANIZER_ROLE)
      get :overview, params: { slug: campaign.slug }
    end

    it 'renders 200' 


    it 'shows the right campaign' 


    it 'shows properties of the campaign' 

  end

  describe '#programs' do
    render_views
    let(:course) { create(:course) }
    let(:course2) { create(:course, title: 'course2', slug: 'foo/course2') }
    let(:campaign) { create(:campaign) }

    before do
      campaign.courses << course << course2
      get :programs, params: { slug: campaign.slug }
    end

    it 'renders 200' 


    it 'shows the right campaign' 


    it 'lists the programs for the given campaign' 


    it 'shows a remove button for the programs if the user is an organizer or admin' 


    it 'searches title, school, and term of campaign courses' 

  end
end

