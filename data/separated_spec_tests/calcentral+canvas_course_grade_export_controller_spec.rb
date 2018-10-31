describe CanvasCourseGradeExportController do

  let(:course_grades) do
    [
      {'uid' => '1001', 'grade' => 84.9, 'comment' => ''},
      {'uid' => '1002', 'grade' => 45.9, 'comment' => ''},
      {'uid' => '1003', 'grade' => 78.2, 'comment' => ''},
      {'uid' => '1004', 'grade' => 95.7, 'comment' => ''},
    ]
  end

  let(:canvas_course_id) { '1164764' }

  before do
    session['user_id'] = '4868640'
    session['canvas_user_id'] = '43232321'
    session['canvas_course_id'] = canvas_course_id
    allow_any_instance_of(Canvas::CoursePolicy).to receive(:can_export_grades?).and_return(true)
    allow_any_instance_of(Canvas::CourseUsers).to receive(:course_grades).and_return(course_grades)
  end

  describe 'when preparing course enrollments cache' do
    let(:torquebox_fake_background_proxy) { double }
    let(:background_job_id) { 'canvas.egrades.12345.1383330151058' }
    before do
      allow(torquebox_fake_background_proxy).to receive(:canvas_course_student_grades).with(true).and_return(nil)
      allow_any_instance_of(CanvasLti::Egrades).to receive(:background).and_return(torquebox_fake_background_proxy)
      allow_any_instance_of(CanvasLti::Egrades).to receive(:save).and_return(nil)
      allow_any_instance_of(CanvasLti::Egrades).to receive(:background_job_id).and_return(background_job_id)
    end

    it_should_behave_like 'an endpoint' do
      let(:make_request) { post :prepare_grades_cache, :canvas_course_id => canvas_course_id, :format => :csv }
      let(:error_text) { 'Something went wrong' }
      before { allow_any_instance_of(CanvasLti::Egrades).to receive(:background_job_initialize).and_raise(RuntimeError, error_text) }
    end

    it_should_behave_like 'an authenticated endpoint' do
      let(:make_request) { post :prepare_grades_cache, :canvas_course_id => canvas_course_id, :format => :csv }
    end

    it 'makes call to load canvas course student grades with forced cacheing' 


    it 'returns background job id' 

  end

  describe 'when resolving issues with course site state related to grade export' do
    before { allow_any_instance_of(CanvasLti::Egrades).to receive(:resolve_issues).and_return(nil) }

    it_should_behave_like 'an endpoint' do
      let(:make_request) { post :resolve_issues, canvas_course_id: 'embedded', :enableGradingScheme => 1, :format => :csv }
      let(:error_text) { 'Something went wrong' }
      before { allow_any_instance_of(CanvasLti::Egrades).to receive(:resolve_issues).and_raise(RuntimeError, error_text) }
    end

    it_should_behave_like 'an authenticated endpoint' do
      let(:make_request) { post :resolve_issues, canvas_course_id: 'embedded', :enableGradingScheme => 1, :format => :csv }
    end

    it 'supports enableGradingScheme option' 


    it 'supports unmuteAssignments option' 

  end

  describe '#job_status' do
    let(:background_job_id) { 'CanvasLti::Egrades.1383330151057-67f4b934525501cb' }

    it_should_behave_like 'an endpoint' do
      let(:error_text) { 'Something went wrong' }
      let(:make_request) { get :job_status, canvas_course_id: canvas_course_id, jobId: background_job_id }
      before { allow(BackgroundJob).to receive(:find).and_raise(RuntimeError, 'Something went wrong') }
    end

    it_should_behave_like 'an authenticated endpoint' do
      let(:make_request) { get :job_status, canvas_course_id: canvas_course_id, jobId: background_job_id }
    end

    it 'returns error if egrades background job not found' 


    it 'returns status of canvas egrades background job' 

  end

  describe 'when serving grade export option data' do
    let(:official_course_sections) do
      [
        {'dept_name'=>'CHEM', 'catalog_id'=>'3BL', 'term_yr'=>'2014', 'term_cd'=>'C', 'course_cntl_num'=>'22280', 'primary_secondary_cd'=>'P', 'section_num'=>'001', 'instruction_format'=>'LEC'},
        {'dept_name'=>'CHEM', 'catalog_id'=>'3BL', 'term_yr'=>'2014', 'term_cd'=>'C', 'course_cntl_num'=>'22345', 'primary_secondary_cd'=>'S', 'section_num'=>'208', 'instruction_format'=>'LAB'}
      ]
    end
    let(:course_settings) do
      {
        'grading_standard_enabled' => true,
        'grading_standard_id' => 0
      }
    end
    let(:muted_assignments) do
      [
        {'name' => 'Assignment 4', 'due_at' => 'Oct 13, 2015 at 8:30am', 'points_possible' => 25},
        {'name' => 'Assignment 7', 'due_at' => 'Oct 18, 2015 at 9:30am', 'points_possible' => 100},
      ]
    end
    let(:section_terms) { [{:term_cd => 'C', :term_yr => '2014'}, {:term_cd => 'D', :term_yr => '2015'}] }
    let(:export_options) do
      {
        :officialSections => official_course_sections,
        :gradingStandardEnabled => false,
        :sectionTerms => section_terms,
        :mutedAssignments => muted_assignments
      }
    end
    before do
      allow_any_instance_of(CanvasLti::Egrades).to receive(:export_options).and_return(export_options)
    end

    it_should_behave_like 'an endpoint' do
      let(:make_request) { get :export_options, canvas_course_id: 'embedded', :format => :csv }
      let(:error_text) { 'Something went wrong' }
      before { allow_any_instance_of(CanvasLti::Egrades).to receive(:export_options).and_raise(RuntimeError, error_text) }
    end

    it_should_behave_like 'an authenticated endpoint' do
      let(:make_request) { get :export_options, canvas_course_id: 'embedded', :format => :csv }
    end

    it 'provides export options' 


    it 'supports canvas course id parameter when absent in session' 

  end

  describe 'when serving egrades download' do

    it_should_behave_like 'an endpoint' do
      let(:make_request) { get :download_egrades_csv, canvas_course_id: 'embedded', :format => :csv, :term_cd => 'D', :term_yr => '2014', :ccn => '1234', :type => 'final' }
      let(:error_text) { 'Something went wrong' }
      before { allow_any_instance_of(CanvasLti::Egrades).to receive(:official_student_grades_csv).and_raise(RuntimeError, error_text) }
    end

    it_should_behave_like 'an authenticated endpoint' do
      let(:make_request) { get :download_egrades_csv, canvas_course_id: 'embedded', :format => :csv, :term_cd => 'D', :term_yr => '2014', :ccn => '1234' }
    end

    context 'when the canvas course id is not present in the session' do
      before { session['canvas_course_id'] = nil }
      it 'returns 403 error' 

    end

    context 'when user is not authorized to download egrades csv' do
      before { allow_any_instance_of(Canvas::CoursePolicy).to receive(:can_export_grades?).and_return(false) }
      it 'returns 403 error' 

    end

    context 'when user is authorized to download egrades csv' do
      let(:csv_string) { "uid,grade,comment\n872584,F,\"\"\n4000123,B,\"\"\n872527,A+,\"\"\n872529,D-,\"\"\n" }
      before { allow_any_instance_of(CanvasLti::Egrades).to receive(:official_student_grades_csv).and_return(csv_string) }
      it 'raises exception if term code not provided' 


      it 'raises exception if term year not provided' 


      it 'raises exception if course control number not provided' 


      it 'raises exception if type not provided' 


      it 'serves egrades csv file download' 


      it 'supports canvas course id parameter when absent in session' 

    end

  end

  describe 'when indicating if a course site has official sections' do
    before do
      session['user_id'] = nil
      allow_any_instance_of(CanvasLti::OfficialCourse).to receive(:is_official_course?).and_return(true)
    end
    it_should_behave_like 'an endpoint' do
      let(:make_request) { get :is_official_course, :format => :csv, :canvas_course_id => '1234' }
      let(:error_text) { 'Something went wrong' }
      before { allow(CanvasLti::OfficialCourse).to receive(:new).and_raise(RuntimeError, error_text) }
    end

    context 'when the canvas course id is not present in the params' do
      it 'returns 403 error' 

    end

    it 'should set cross origin access control headers' 


    it 'indicates if the course site has official sections' 

  end

end

