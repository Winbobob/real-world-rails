require 'rails_helper'

describe 'Circle Files', js: true do
  context 'uploading a file' do

    # 1) put application into a known state
    let!(:circle) { submit_form(:circle_create_form).result }
    let!(:admin) { circle.admins.first }
    let(:local_file_path) { File.expand_path('spec/fixtures/images/avatar.jpg') }
    let(:file_name) { "Test File" }

    it 'works' 

  end
end

