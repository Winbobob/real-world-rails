describe AnnotationCategoriesController do
  before :each do
    # Authenticate user is not timed out, and has administrator rights.
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(FactoryBot.create(:admin))
  end

  let(:annotation_category) { FactoryBot.create(:annotation_category) }
  let(:assignment) { FactoryBot.create(:assignment) }

  context 'csv_upload' do
    before :each do
      # We need to mock the rack file to return its content when
      # the '.read' method is called to simulate the behaviour of
      # the http uploaded file
      @file_good = fixture_file_upload(
        'files/annotation_categories/form_good.csv', 'text/csv')
      allow(@file_good).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/annotation_categories/form_good.csv',
                    'text/csv')))

      @file_invalid_column = fixture_file_upload(
        'files/annotation_categories/form_invalid_column.csv', 'text/csv')
      allow(@file_invalid_column).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/annotation_categories/form_invalid_column.csv',
                    'text/csv')))

      @file_bad_csv = fixture_file_upload(
        'files/bad_csv.csv', 'text/xls')
      allow(@file_bad_csv).to receive(:read).and_return(
        File.read(fixture_file_upload('files/bad_csv.csv', 'text/csv')))

      @file_wrong_format = fixture_file_upload(
        'files/wrong_csv_format.xls', 'text/xls')
      allow(@file_wrong_format).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/wrong_csv_format.xls', 'text/csv')))
      # This must line up with the second entry in the file_good
      @test_category_name = 'test_category'
      @test_content = 'c6conley'
    end

    it 'accepts a valid file' 


    it 'does not accept files with invalid columns' 


    it 'does not accept fileless submission' 


    it 'does not accept a non-csv file with .csv extension' 


    it 'does not accept a .xls file' 

  end

  context 'CSV_Downloads' do
    let(:annotation_category) { create(:annotation_category,
                                       assignment: assignment) }
    let(:annotation_text) { create(:annotation_text,
                                   annotation_category: annotation_category) }
    let(:csv_data) { "#{annotation_category.annotation_category_name}," +
      "#{annotation_text.content}\n" }
    let(:csv_options) do
      {
        filename: "#{assignment.short_identifier}_annotations.csv",
        disposition: 'attachment'
      }
    end

    it 'responds with appropriate status' 


    # parse header object to check for the right disposition
    it 'sets disposition as attachment' 


    it 'expects a call to send_data' 


    # parse header object to check for the right content type
    it 'returns vnd.ms-excel type' 


    # parse header object to check for the right file naming convention
    it 'filename passes naming conventions' 

  end

  context 'When searching for an annotation text' do
    before(:each) do
      @annotation_text_one = create(:annotation_text,
                                    annotation_category: annotation_category,
                                    content: "This is an annotation text.")

    end

    it 'should render an annotation context, where first part of its content matches given string' 


    it 'should render an empty string if string does not match first part of any annotation text' 


    it 'should render an empty string if string matches first part of more than one annotation text' 

  end
end

