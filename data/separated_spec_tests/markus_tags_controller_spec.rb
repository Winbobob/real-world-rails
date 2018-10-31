require 'spec_helper'

describe TagsController do
  before :each do
    # Authenticate user is not timed out, and has administrator rights.
    allow(controller).to receive(:session_expired?).and_return(false)
    allow(controller).to receive(:logged_in?).and_return(true)
    allow(controller).to receive(:current_user).and_return(build(:admin))
  end

  let(:assignment) { FactoryGirl.create(:assignment) }

  context 'download_tag_list' do
    let(:csv_options) do
      {
        type: 'text/csv',
        disposition: 'attachment',
        filename: 'tag_list.csv'
      }
    end

    before :each do
      @user = create(:student)
      @tag1 = Tag.find_or_create_by(name: 'tag1')
      @tag1.name = 'tag1'
      @tag1.description = 'tag1_description'
      @tag1.user = @user
      @tag1.save

      @tag2 = Tag.find_or_create_by(name: 'tag2')
      @tag2.name = 'tag2'
      @tag2.description = 'tag2_description'
      @tag2.user = @user
      @tag2.save
    end

    it 'responds with appropriate status' 


    # parse header object to check for the right disposition
    it 'sets disposition as attachment' 


    it 'expects a call to send_data' 


    # parse header object to check for the right content type
    it 'returns text/csv type' 

  end

  context 'CSV_Uploads' do
    before :each do
      # We need to mock the rack file to return its content when
      # the '.read' method is called to simulate the behaviour of
      # the http uploaded file
      @file_good = fixture_file_upload(
        'files/tags/form_good.csv', 'text/csv')
      allow(@file_good).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/tags/form_good.csv',
                    'text/csv')))

      @file_invalid_column = fixture_file_upload(
        'files/tags/form_invalid_column.csv', 'text/csv')
      allow(@file_invalid_column).to receive(:read).and_return(
        File.read(fixture_file_upload(
                    'files/tags/form_invalid_column.csv',
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

      #set the :back redirect
      @redirect = 'index'
      request.env['HTTP_REFERER'] = @redirect
    end

    it 'accepts a valid file' 


    it 'does not accept files with invalid columns' 


    it 'does not accept fileless submission' 


    it 'does not accept a non-csv file with .csv extension' 


    it 'does not accept a .xls file' 

  end
end

