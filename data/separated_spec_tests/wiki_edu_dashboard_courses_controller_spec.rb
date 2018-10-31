# frozen_string_literal: true

require 'rails_helper'

describe CoursesController do
  before { stub_wiki_validation }
  describe '#show' do
    let(:course) { create(:course) }
    let(:slug) { course.slug }
    let(:school) { slug.split('/')[0] }
    let(:titleterm) { slug.split('/')[1] }

    context 'for an valid course path' do
      it 'renders a 200' 

    end

    context 'when a spider tries index.php' do
      it 'renders a plain text 404' 

    end
  end

  describe '#destroy' do
    let!(:course)           { create(:course) }
    let!(:user)             { create(:test_user) }
    let!(:courses_users)    { create(:courses_user, course_id: course.id, user_id: user.id) }
    let!(:article)          { create(:article) }
    let!(:articles_courses) do
      create(:articles_course, course_id: course.id, article_id: article.id)
    end

    let!(:assignment) { create(:assignment, course_id: course.id) }
    let!(:campaigns_courses) { create(:campaigns_course, course_id: course.id) }
    let!(:week) { create(:week, course_id: course.id) }

    let!(:gradeable) do
      create(:gradeable, gradeable_item_type: 'Course', gradeable_item_id: course.id)
    end

    let!(:admin) { create(:admin, id: 2) }

    before do
      allow(controller).to receive(:current_user).and_return(admin)
      controller.instance_variable_set(:@course, course)
    end

    it 'calls update methods via WikiCourseEdits' 


    context 'destroy callbacks' do
      before do
        allow_any_instance_of(WikiCourseEdits).to receive(:update_assignments)
        allow_any_instance_of(WikiCourseEdits).to receive(:update_course)
      end

      it 'destroys associated models' 


      it 'returns success' 


      it 'deletes the course' 

    end
  end

  describe '#update' do
    let(:submitted_1) { false }
    let(:submitted_2) { false }
    let!(:course) { create(:course, submitted: submitted_1) }
    let(:user) { create(:admin) }
    let!(:courses_user) do
      create(:courses_user,
             course_id: course.id,
             user_id: user.id,
             role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
    end
    let(:course_params) do
      { title: 'New title',
        description: 'New description',
        start: 2.months.ago.beginning_of_day,
        end: 2.months.from_now.end_of_day,
        term: 'pizza',
        slug: 'food',
        subject: 'cooking',
        expected_students: 1,
        submitted: submitted_2,
        day_exceptions: '',
        weekdays: '0001000',
        no_day_exceptions: true,
        home_wiki_id: 1 }
    end
    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
      allow_any_instance_of(WikiCourseEdits).to receive(:update_course)
    end

    it 'updates all values' 


    context 'setting passcode' do
      let(:course) { create(:course) }
      before { course.update_attribute(:passcode, nil) }

      it 'sets if it is nil and not in params' 

    end

    describe 'toggling timeline' do
      it 'sets the course flag to true' 


      it 'sets the course flag to false' 

    end

    it 'raises if course is not found' 


    it 'returns the new course as json' 


    context 'course is not new' do
      let(:submitted_1) { true }
      let(:submitted_2) { true }
      it 'does not announce course' 

    end

    context 'course is new' do
      let(:submitted_2) { true }
      it 'announces course and emails the instructor' 

    end
  end

  describe '#create' do
    describe 'setting slug from school/title/term' do
      let!(:user) { create(:admin) }
      let(:expected_slug) { 'Wiki_University/How_to_Wiki_(Fall_2015)' }
      let(:role_description) { 'Professor' }

      before do
        allow(controller).to receive(:current_user).and_return(user)
        allow(controller).to receive(:user_signed_in?).and_return(true)
      end

      context 'all slug params present' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20',
            role_description: role_description,
            passcode: 'passcode' }
        end
        it 'sets slug correctly' 


        it 'sets instructor role description correctly' 


        it 'sets passcode correctly' 

      end

      context 'sets en empty passcode' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20',
            type: 'Editathon',
            passcode: 'no-passcode' }
        end

        it 'creates an empty passcode' 

      end

      context 'not all slug params present' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki' }
        end
        it 'does not set slug (and does not create course)' 

      end

      context 'valid language and project present' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20',
            language: 'ar',
            project: 'wikibooks' }
        end

        it 'sets the non-default home_wiki' 


        it 'assigns the new course to @course' 

      end

      context 'invalid language and project present' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20',
            language: 'arrr',
            project: 'wikipirates' }
        end

        it 'renders a 404 and does not create the course' 

      end

      context 'when blank values are given for course school, title or both' do
        let(:course_params) do
          { school: ' ',
            title: '  ',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20',
            language: 'en',
            project: 'wikipedia' }
        end

        it 'renders a 404 and does not create the course when school is blank' 


        it 'renders a 404 and does not create the course when title is blank' 


        it 'renders a 404 and does not create the course when both school and title are blank' 

      end

      context 'when a course with the same slug already exists' do
        let(:course_params) do
          { school: 'Wiki University',
            title: 'How to Wiki',
            term: 'Fall 2015',
            start: '2015-01-05',
            end: '2015-12-20' }
        end
        before do
          post :create, params: { course: course_params }, as: :json
        end

        it 'renders a 404 and does not create the course' 

      end

      describe 'timeline dates' do
        let(:course_params) do
          { title: 'New title',
            description: 'New description',
            start: 2.months.ago.beginning_of_day,
            end: 2.months.from_now.end_of_day,
            school: 'burritos',
            term: 'pizza',
            slug: 'food',
            subject: 'cooking',
            expected_students: 1,
            submitted: false,
            day_exceptions: '',
            weekdays: '0001000',
            no_day_exceptions: true }
        end
        it 'sets timeline start/end to course start/end if not in params' 

      end
    end
  end

  describe '#list' do
    let(:course) { create(:course) }
    let(:campaign) { Campaign.last }
    let(:user) { create(:admin) }

    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end

    context 'when campaign is not found' do
      it 'gives a failure message' 

    end

    context 'when campaign is found' do
      context 'post request' do
        before do
          create(:courses_user, user_id: user.id,
                                course_id: course.id,
                                role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
          stub_chat_channel_create_success
        end

        it 'creates a CampaignsCourse' 


        it 'sends an email if course has no previous campaigns' 


        it 'creates a chat channel if course has no previous campaigns' 


        it 'does not send an email if course is already approved' 

      end

      context 'delete request' do
        let!(:campaigns_course) do
          create(:campaigns_course, campaign_id: campaign.id, course_id: course.id)
        end

        it 'deletes CampaignsCourse' 

      end
    end
  end

  describe '#tag' do
    let(:course) { create(:course) }
    let(:user)   { create(:admin) }

    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end

    context 'post request' do
      let(:tag) { 'pizza' }
      it 'creates a tag' 

    end

    context 'delete request' do
      let(:tag) { Tag.create(tag: 'pizza', course_id: course.id) }
      it 'deletes the tag' 

    end
  end

  describe '#needs_update' do
    render_views
    let(:course) { create(:course, needs_update: false) }
    before do
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end
    it 'sets "needs_update" to true' 

  end

  describe '#notify_untrained' do
    let(:course) { create(:course) }
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:instructor) do
      create(:user, id: 5)
      create(:courses_user, user_id: 5,
                            course_id: course.id,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      User.find(5)
    end

    before do
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end

    let(:subject) { get :notify_untrained, params: { id: course.slug } }

    context 'user is admin' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
      end

      it 'triggers WikiEdits.notify_untrained' 

    end

    context 'user is instructor' do
      before do
        allow(controller).to receive(:current_user).and_return(instructor)
      end

      it 'triggers WikiEdits.notify_untrained' 

    end

    context 'user is not admin or instructor' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'returns a 401' 

    end
  end

  describe '#update_syllabus' do
    let(:course) { create(:course) }
    let(:instructor) do
      create(:user, id: 5)
      create(:courses_user, user_id: 5,
                            course_id: course.id,
                            role: CoursesUsers::Roles::INSTRUCTOR_ROLE)
      User.find(5)
    end

    before do
      allow(controller).to receive(:current_user).and_return(instructor)
    end

    it 'saves a pdf' 


    it 'deletes a saved file' 


    it 'renders an error for disallowed file types' 

  end

  describe '#delete_all_weeks' do
    let(:course) { create(:course) }
    let!(:user) { create(:admin) }
    let!(:week1) { create(:week, course_id: course.id) }
    let!(:week2) { create(:week, course_id: course.id) }

    before do
      allow(controller).to receive(:current_user).and_return(user)
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end

    it 'deletes all the weeks' 

  end
end

