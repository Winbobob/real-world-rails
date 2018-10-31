require 'spec_helper'

describe TasController do
  before :each do
    # Authenticate user is not timed out, and has administrator rights.
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(build(:admin))
  end

  context 'CSV_Uploads' do
    before :each do
      # We need to mock the rack file to return its content when
      # the '.read' method is called to simulate the behaviour of
      # the http uploaded file
      @file_good = fixture_file_upload(
        'files/tas/form_good.csv', 'text/csv')
      allow(@file_good).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/tas/form_good.csv',
                    'text/csv')))

      @file_invalid_column = fixture_file_upload(
        'files/tas/form_invalid_column.csv', 'text/csv')
      allow(@file_invalid_column).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/tas/form_invalid_column.csv',
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
    end

    it 'accepts a valid file' 


    it 'does not accept files with invalid columns' 


    it 'does not accept fileless submission' 


    it 'does not accept a non-csv file with .csv extension' 


    it 'does not accept a .xls file' 

  end

  context 'download_ta_list' do
    context 'csv' do
      let(:csv_options) do
        {
          type: 'text/csv',
          filename: 'ta_list.csv',
          disposition: 'attachment'
        }
      end

      before :each do
        # create some test tas
        (0..4).each do
          create(:ta)
        end
        @tas = Ta.order(:user_name)
      end

      it 'responds with appropriate status' 


      # parse header object to check for the right disposition
      it 'sets disposition as attachment' 


      it 'expects a call to send_data' 


      # parse header object to check for the right content type
      it 'returns text/csv type' 

    end
  end
end

