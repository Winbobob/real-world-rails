# frozen_string_literal: true

require 'rails_helper'

describe AttachFilesToWorkJob do
  let(:user)          { create(:user) }
  let(:work)          { create(:work, title: [title], depositor: user.login) }
  let(:title)         { 'AttachFilesToWorkJob Example' }
  let(:file)          { File.open(File.join(fixture_path, 'world.png')) }
  let(:uploaded_file) { Sufia::UploadedFile.create(file: file, user: user) }
  let(:visibility_attributes) { { visibility: 'open' } }
  let(:job) { described_class.new(work, [uploaded_file], visibility_attributes) }

  before do
    QueuedFile.create(work_id: work.id, file_id: uploaded_file.id)
    allow(Hydra::Works::VirusCheckerService).to receive(:file_has_virus?).and_return(false)
  end

  context 'when the file is successfully added' do
    it 'sends a success message' 

  end

  context 'when specifying an embargo' do
    let(:title) { 'Embargo Job Example' }
    let(:visibility_attributes) do
      {
        visibility: 'embargo',
        visibility_during_embargo: 'restricted',
        embargo_release_date: '2020-06-08',
        visibility_after_embargo: 'open'
      }
    end

    it 'creates file sets with the embargo' 

  end

  context 'when the file is not successfully added' do
    let(:bad_actor) { double(CurationConcerns::Actors::FileSetActor) }

    before do
      allow(bad_actor).to receive(:create_content).with(file).and_return(false)
      allow(bad_actor).to receive(:user).and_return(user)
    end
    it 'sends a success message' 

  end
end

