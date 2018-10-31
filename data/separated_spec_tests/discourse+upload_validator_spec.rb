require 'rails_helper'
require_dependency 'validators/upload_validator'

describe Validators::UploadValidator do
  subject(:validator) { described_class.new }

  describe 'validate' do
    let(:user) { Fabricate(:user) }
    let(:filename) { "discourse.csv" }
    let(:csv_file) { file_from_fixtures(filename, "csv") }

    it "should create an invalid upload when the filename is blank" 


    it "allows 'gz' as extension when uploading export file" 


    it "allows uses max_export_file_size_kb when uploading export file" 

  end
end

