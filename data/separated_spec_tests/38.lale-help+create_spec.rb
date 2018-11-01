require 'rails_helper'

describe FileUpload::Create do
  before(:all) do
    FileUpload.directory.files.each { |f| f.destroy }
  end

  let(:uploaded_file) do
    ActionDispatch::Http::UploadedFile.new({
      tempfile: File.open('spec/fixtures/images/avatar.jpg'),
      filename: 'avatar.jpeg',
      type: "image/jpeg"
    })
  end

  let(:uploader) { create(:user)  }

  it "can store a file" 

end

