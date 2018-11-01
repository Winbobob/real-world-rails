# frozen_string_literal: true

require 'rails_helper'

describe IngestLocalFileJob do
  let(:user)     { create(:user) }
  let(:file_set) { FileSet.new }
  let(:actor)    { double }
  let(:path)     { File.join(fixture_path, 'world.png') }
  let(:mock_upload_directory) { 'spec/mock_upload_directory' }

  before do
    allow(CurationConcerns::Actors::FileSetActor).to receive(:new).with(file_set, user).and_return(actor)
  end

  it 'ingests a file without deleting it' 

end

