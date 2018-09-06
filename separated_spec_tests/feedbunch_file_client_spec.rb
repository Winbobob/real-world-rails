require 'rails_helper'

describe FileClient do

  before :each do
    @file_content = 'some_file_content'
    @filename = 'filename.txt'
    @upload_folder = OPMLImporter::FOLDER
    @user = FactoryBot.create :user
    @filepath = File.join Rails.root, @upload_folder, @user.id.to_s, @filename
  end

  after :each do
    upload_dir = File.join Rails.root, @upload_folder, @user.id.to_s
    FileUtils.rm_rf upload_dir if File.directory? upload_dir
  end

  it 'saves file in some folder' 


  it 'deletes file from uploads folder' 


  it 'reads file from uploads folder' 


  it 're-raises any errors' 


  it 'returns true if file exists' 


  it 'returns false if file does not exist' 


end

