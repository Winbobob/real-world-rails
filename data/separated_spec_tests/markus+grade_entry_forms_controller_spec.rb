describe GradeEntryFormsController do
  before :each do
    # Authenticate user is not timed out, and has administrator rights.
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(build(:admin))

    # initialize student DB entries
    create(:user, user_name: 'c8shosta', type: 'Student')
  end

  let(:grade_entry_form) { create(:grade_entry_form) }
  let(:grade_entry_form_with_data) { create(:grade_entry_form_with_data) }

  context 'CSV_Uploads' do
    before :each do
      @file_without_extension =
        fixture_file_upload('files/empty_file', 'text/xml')
      @file_wrong_format =
        fixture_file_upload(
          'files/wrong_csv_format.xls', 'text/xls')
      @file_bad_csv =
        fixture_file_upload(
          'files/bad_csv.csv', 'text/xls')
      @file_bad_endofline =
        fixture_file_upload(
          'files/grade_entry_upload_file_bad_endofline.csv',
          'text/csv')
      @file_invalid_username =
        fixture_file_upload(
          'files/grade_entry_form_invalid_username.csv',
          'text/csv')
      @file_extra_column =
        fixture_file_upload(
          'files/grade_entry_form_extra_column.csv',
          'text/csv')
      @file_different_column_name =
        fixture_file_upload(
          'files/grade_entry_form_different_column_name.csv',
          'text/csv')
      @file_different_total =
        fixture_file_upload(
          'files/grade_entry_form_different_total.csv',
          'text/csv')
      @file_good =
        fixture_file_upload(
          'files/grade_entry_form_good.csv',
          'text/csv')
    end

    it 'accepts valid file' 


    xit 'does not accept csv file with an invalid username' do
      # TODO: currently pending: intermittently fails with ActiveRecord::RecordNotUnique error
      post :csv_upload, params: { id: grade_entry_form_with_data, upload: { grades_file: @file_invalid_username } }
      expect(response.status).to eq(302)
      expect(flash[:error]).to_not be_empty
      puts flash[:error]
      expect(response).to redirect_to(
        grades_grade_entry_form_path(grade_entry_form_with_data, locale: 'en'))
    end

    xit 'accepts files with additional columns' do
      post :csv_upload, params: { id: grade_entry_form_with_data, upload: { grades_file: @file_extra_column } }
      expect(response.status).to eq(302)
      expect(flash[:error]).to be_nil
      expect(response).to redirect_to(
        grades_grade_entry_form_path(grade_entry_form_with_data, locale: 'en'))
    end

    it 'accepts files with a different column name' 


    it 'accepts files with a different grade total' 


    it 'does not accept a csv file corrupt line endings' 


    it 'does not break on a file with no extension' 


    it 'does not accept fileless submission' 


    it 'should gracefully fail on non-csv file with .csv extension' 


    it 'should gracefully fail on .xls file' 

  end

  context 'CSV_Downloads' do
    let(:csv_options) do
      {
        filename:
          "#{grade_entry_form_with_data.short_identifier}_grades_report.csv",
        disposition: 'attachment',
        type: 'text/csv'
      }
    end

    before :each do
      @user = User.where(user_name: 'c8shosta').first
    end

    it 'tests that action csv_downloads returns OK' 


    it 'expects a call to send_data' 


    # parse header object to check for the right disposition
    it 'sets disposition as attachment' 


    # parse header object to check for the right content type
    it 'returns text/csv type' 


    # parse header object to check for the right file naming convention
    it 'filename passes naming conventions' 

  end
end

