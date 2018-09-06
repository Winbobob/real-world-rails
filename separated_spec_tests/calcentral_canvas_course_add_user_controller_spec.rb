describe CanvasCourseAddUserController do

  let(:student_enrollment_hash) do
    {'course_id' => 767330, 'course_section_id' => 1312468, 'id' => 20241907, 'type' => 'StudentEnrollment', 'role' => 'StudentEnrollment'}
  end

  let(:ta_enrollment_hash) do
    {'course_id' => 767330, 'course_section_id' => 1312468, 'id' => 20241907, 'type' => 'TaEnrollment', 'role' => 'TaEnrollment'}
  end

  let(:teacher_enrollment_hash) do
    {'course_id' => 767330, 'course_section_id' => 1312468, 'id' => 20241908, 'type' => 'TeacherEnrollment', 'role' => 'TeacherEnrollment'}
  end

  let(:canvas_course_user_hash) do
    { 'id' => 4321321, 'name' => 'Michael Steven OWEN', 'sis_user_id' => 'UID:105431', 'sis_login_id' => '105431', 'login_id' => '105431', 'enrollments' => [student_enrollment_hash] }
  end

  let(:users_found) do
    [
      { 'firstName' => 'Felix', 'lastName' => 'Gracia', 'emailAddress' => 'fgracia@example.edu', 'ldapUid' => '12890', 'affiliations' => 'EMPLOYEE-TYPE-STAFF,STUDENT-STATUS-EXPIRED' },
      { 'firstName' => 'Brian', 'lastName' => 'Spires', 'emailAddress' => 'brianlspires@example.edu', 'ldapUid' => '10054', 'affiliations' => 'EMPLOYEE-STATUS-EXPIRED,STUDENT-STATUS-EXPIRED' },
      { 'firstName' => 'Maria', 'lastName' => 'Patterson', 'emailAddress' => 'mjpatterson@example.edu', 'ldapUid' => '4883', 'affiliations' => 'STUDENT-TYPE-REGISTERED,EMPLOYEE-TYPE-ACADEMIC' },
    ]
  end

  let(:course_sections_list) do
    [
      {'id' => '202184', 'name' => 'Section One Name'},
      {'id' => '1237009', 'name' => 'Section Two Name'}
    ]
  end

  let(:canvas_root_url) { 'https://ucb.beta.example.com' }
  let(:canvas_course_id) {'767330'}

  before do
    session['user_id'] = '12345'
    session['canvas_user_id'] = '43232321'
    allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(canvas_course_user_hash)
    allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(true)
    allow_any_instance_of(CanvasLti::CourseAddUser).to receive(:course_sections_list).and_return(course_sections_list)
    allow(Settings.canvas_proxy).to receive(:url_root).and_return(canvas_root_url)
  end

  shared_examples 'a course-access protected controller' do

    context 'when serving course user role information' do

      it_should_behave_like 'an api endpoint' do
        before { allow(subject).to receive(:course_user_roles).and_raise(RuntimeError, 'Something went wrong') }
        let(:make_request) { get :course_user_roles, request_params }
      end

      it_should_behave_like 'a user authenticated api endpoint' do
        let(:make_request) { get :course_user_roles, request_params }
      end

      context 'when session with canvas course user present' do

        context 'when user is student' do
          let(:canvas_course_student_hash) { canvas_course_user_hash.merge({'enrollments' => [student_enrollment_hash]}) }
          before do
            allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(false)
            allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(canvas_course_student_hash)
          end
          context 'advisor in view-as mode' do
            let(:make_request) { get :course_user_roles, request_params }
            before { allow(Settings.features).to receive(:reauthentication).and_return false }
            it_behaves_like 'an unauthorized endpoint for users in advisor-view-as mode'
          end

          it 'returns canvas root url and course id' 


          it 'returns course user details' 


          it 'returns no granting roles' 

        end

        context 'when user is teachers assistant' do
          let(:canvas_course_ta_hash) { canvas_course_user_hash.merge({'enrollments' => [ta_enrollment_hash]}) }
          before do
            allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(false)
            allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(canvas_course_ta_hash)
          end

          it 'returns canvas root url and course id' 


          it 'returns course user details' 


          it 'returns student and observer granting roles' 

        end

        context 'when user is canvas course teacher' do
          let(:canvas_course_teacher_hash) { canvas_course_user_hash.merge({'enrollments' => [teacher_enrollment_hash]}) }
          before do
            allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(false)
            allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(canvas_course_teacher_hash)
          end

          it 'returns canvas root url and course id' 


          it 'returns course user details' 


          it 'returns all granting roles' 

        end

        context 'when user is canvas account admin' do
          before do
            allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(true)
            allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(nil)
          end

          it 'returns canvas root url and course id' 


          it 'returns canvas admin user details' 


          it 'returns all granting roles' 

        end
      end
    end

    context 'when performing user search' do
      before do
        allow(CanvasLti::CourseAddUser).to receive(:search_users).and_return(users_found)
      end

      it_should_behave_like 'an api endpoint' do
        before { allow(subject).to receive(:search_users).and_raise(RuntimeError, 'Something went wrong') }
        let(:make_request) { get :search_users, request_params.merge(searchText: 'John Doe', searchType: 'name') }
      end

      it_should_behave_like 'a user authenticated api endpoint' do
        let(:make_request) { get :search_users, request_params.merge(searchText: 'John Doe', searchType: 'name') }
      end

      it_should_behave_like 'a canvas course admin authorized api endpoint' do
        let(:make_request) { get :search_users, request_params.merge(searchText: 'John Doe', searchType: 'name') }
      end

      it 'returns error if searchText parameter is blank' 


      it 'returns error if searchType parameter is not valid' 


      it 'returns user search results' 

    end

    context 'when obtaining list of course sections' do
      it_should_behave_like 'an api endpoint' do
        before { allow(subject).to receive(:course_sections).and_raise(RuntimeError, 'Something went wrong') }
        let(:make_request) { get :course_sections, request_params }
      end

      it_should_behave_like 'a user authenticated api endpoint' do
        let(:make_request) { get :course_sections, request_params }
      end

      it_should_behave_like 'a canvas course admin authorized api endpoint' do
        let(:make_request) { get :course_sections, request_params }
      end

      it 'returns sections for search' 

    end

    context 'when adding user to course' do
      before { allow(CanvasLti::CourseAddUser).to receive(:add_user_to_course_section).and_return(true) }

      it_should_behave_like 'an api endpoint' do
        before { allow(subject).to receive(:add_user).and_raise(RuntimeError, 'Something went wrong') }
        let(:make_request) { post :add_user, request_params.merge(ldapUserId: '260506', role: 'Student', sectionId: 202184) }
      end

      it_should_behave_like 'a user authenticated api endpoint' do
        let(:make_request) { post :add_user, request_params.merge(ldapUserId: '260506', role: 'Student', sectionId: 202184) }
      end

      it_should_behave_like 'a canvas course admin authorized api endpoint' do
        let(:make_request) { post :add_user, request_params.merge(ldapUserId: '260506', role: 'Student', sectionId: 202184) }
      end

      context 'when role specified is authorized' do
        let(:canvas_course_ta_hash) { canvas_course_user_hash.merge({'enrollments' => [ta_enrollment_hash]}) }
        before do
          allow_any_instance_of(Canvas::Admins).to receive(:admin_user?).and_return(false)
          allow_any_instance_of(Canvas::CourseUser).to receive(:course_user).and_return(canvas_course_ta_hash)
        end

        it 'adds user to course section' 


        context 'when specified section is not in Canvas course' do
          it 'denies the request' 

        end

        context 'when role specified is not authorized' do
          it 'denies unauthorized roles' 

        end
      end

    end

  end

  context 'standalone in CalCentral with explicit Canvas course ID' do
    let(:request_params) { {canvas_course_id: canvas_course_id} }
    it_behaves_like 'a course-access protected controller'
  end

  context 'in LTI context' do
    let(:request_params) { {canvas_course_id: 'embedded'} }
    before do
      session['canvas_course_id'] = canvas_course_id
    end
    it_behaves_like 'a course-access protected controller'
  end

end

