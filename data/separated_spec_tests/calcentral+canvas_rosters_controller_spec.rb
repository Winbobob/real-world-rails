describe CanvasRostersController do
  let(:user_id)           { Settings.canvas_proxy.test_user_id }
  let(:canvas_course_id)  { '767330' }
  let(:section_ccn)       { '1394824' }
  let(:student_id)        { rand(99999) }
  let(:roster_feed) do
    {
      :canvas_course => {"id" => 27},
      :sections => [
        {
          :ccn => section_ccn,
          :name => 'COMPSCI 47C SLF 001',
          :sis_id => 'SEC:2014-D-25749'
        }
      ],
      :students => [
        {
          :student_id => '24899123',
          :first_name => 'Sam',
          :last_name => 'Samwich',
          :email => 'sam.samwich@example.com',
          :enroll_status => 'E',
          :id => 4886773,
          :section_ccns => [section_ccn],
          :sections => [{:id => section_ccn}],
          :login_id => '1038892',
          :photo => '/canvas/1224681/photo/4886773'
        },
        {
          :student_id => '23973124',
          :first_name => 'Kate',
          :last_name => 'Kathimyer',
          :email => 'kkathimyer@example.com',
          :enroll_status => 'W',
          :id => 4911017,
          :section_ccns => [section_ccn],
          :sections => [{:id => section_ccn}],
          :login_id => '1006997',
          :photo => '/canvas/1224681/photo/4911017'
        },
      ]
    }
  end
  let(:photo_file) { {:data => '\xFF\xD8\xFF\xE0\x00\x10JFIF\x00\x01\x01'} }

  before do
    # emulate user authenticated via LTI Launch from a Canvas Course
    session['user_id'] = user_id
    session['canvas_course_id'] = canvas_course_id
    allow_any_instance_of(Canvas::CoursePolicy).to receive(:is_canvas_course_teacher_or_assistant?).and_return(true)
    allow_any_instance_of(Rosters::Canvas).to receive(:get_feed).and_return(roster_feed)
  end

  context 'when serving course rosters csv download' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:get_csv).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :get_csv, canvas_course_id: 'embedded', :format => :csv }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :get_csv, canvas_course_id: 'embedded', :format => :csv }
    end

    context 'when canvas course roster csv requested via non-embedded session' do
      before { session['canvas_course_id'] = nil }
      it 'should response with roster csv' 

    end

    context 'when user is not authorized' do
      before { allow_any_instance_of(Canvas::CoursePolicy).to receive(:is_canvas_course_teacher_or_assistant?).and_return(false) }
      it 'should respond with empty http 403' 

    end

    context 'when canvas course id not present' do
      before { session['canvas_course_id'] = nil }
      it 'should respond with empty http 403' 

    end
  end

  context 'when serving course rosters feed' do

    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:get_feed).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :get_feed, canvas_course_id: 'embedded' }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :get_feed, canvas_course_id: 'embedded' }
    end

    context 'when canvas course requested via non-embedded session' do
      before { session['canvas_course_id'] = nil }
      it 'should response with roster feed' 

    end

    context 'when user is authorized' do
      it 'should respond with roster feed' 

    end

    context 'when user is not authorized' do
      before { allow_any_instance_of(Canvas::CoursePolicy).to receive(:is_canvas_course_teacher_or_assistant?).and_return(false) }
      it 'should respond with empty http 403' 

    end

    context 'when canvas course id not present' do
      before { session['canvas_course_id'] = nil }
      it 'should respond with empty http 403' 

    end
  end

  context 'when serving course enrollee photo' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:photo_data_or_file).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :photo, canvas_course_id: canvas_course_id, person_id: student_id }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :photo, canvas_course_id: canvas_course_id, person_id: student_id }
    end

    it 'should return error if user is not authorized' 


    context 'if photo path returned for enrollee' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:photo_data_or_file).and_return(photo_file) }
      it 'should return photo' 

    end

  end

  context 'when serving profile URL' do
    it_should_behave_like 'an api endpoint' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:profile_url_for_ldap_id).and_raise(RuntimeError, 'Something went wrong') }
      let(:make_request) { get :profile, canvas_course_id: canvas_course_id, person_id: student_id }
    end

    it_should_behave_like 'a user authenticated api endpoint' do
      let(:make_request) { get :profile, canvas_course_id: canvas_course_id, person_id: student_id }
    end

    context 'when user is authorized' do
      let(:canvas_student_id) { rand(999999) }
      let(:canvas_profile_url) { "http://ucberkeley.beta.instructure.com/courses/#{canvas_student_id}/users/#{canvas_student_id}" }
      before { allow_any_instance_of(Rosters::Canvas).to receive(:profile_url_for_ldap_id).and_return(canvas_profile_url) }
      it 'should redirect to a Canvas profile URL' 

    end

    context 'when profile URL not found' do
      before { allow_any_instance_of(Rosters::Canvas).to receive(:profile_url_for_ldap_id).and_return(nil) }
      it 'should redirect to 404' 

    end

    context 'when user is not authorized' do
      before { allow_any_instance_of(Canvas::CoursePolicy).to receive(:is_canvas_course_teacher_or_assistant?).and_return(false) }
      it 'should respond with an empty HTTP 403' 

    end

    context 'when Canvas course ID is not present' do
      before { session['canvas_course_id'] = nil }
      it 'should respond with an empty HTTP 403' 

    end
  end

end

