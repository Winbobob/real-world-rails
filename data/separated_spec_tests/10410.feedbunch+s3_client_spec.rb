require 'rails_helper'

describe S3Client do

  before :each do
    @user = FactoryBot.create :user
    @file_content = 'some_file_content'
    @filename = 'filename.txt'
    @upload_folder = OPMLImporter::FOLDER
    @s3_key = "#{@upload_folder}/#{@user.id.to_s}/#{@filename}"

    # Substitute the AWS S3 object that makes the call to the AWS API with
    # a mock object
    @s3_body_mock = double 'body', read: @file_content
    @s3_get_mock = double 'get', body: @s3_body_mock
    @s3_object_mock = double 'object', key: @s3_key, delete: nil, get: @s3_get_mock, exists?: true
    @s3_bucket_mock = double 'bucket', put_object: @s3_object_mock, object: @s3_object_mock
    @s3_resource_mock = double 'resource', bucket: @s3_bucket_mock

    allow(Aws::S3::Resource).to receive(:new).and_return @s3_resource_mock
  end

  it 'uploads file to S3' 


  it 'deletes file from S3' 


  it 'reads file from S3' 


  it 're-raises any errors' 


  it 'returns true if file exists' 


  it 'returns false if file does not exist' 


end

