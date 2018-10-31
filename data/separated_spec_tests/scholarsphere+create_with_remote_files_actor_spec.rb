# frozen_string_literal: true

require 'rails_helper'

describe Sufia::CreateWithRemoteFilesActor do
  let(:user) { create(:user) }
  let(:work) { create(:work, user: user) }

  let(:create_actor) do
    double('create actor', create: true,
                           curation_concern: work,
                           user: user)
  end
  let(:actor) do
    CurationConcerns::Actors::ActorStack.new(work, user, [described_class])
  end

  before do
    allow(CurationConcerns::Actors::RootActor).to receive(:new).and_return(create_actor)
    allow(create_actor).to receive(:create).and_return(true)
  end

  context 'with filename that have spaces' do
    let(:remote_files) do
      [{ url: 'file:///local/file/ pigs .txt',
         expires: '2014-03-31T20:37:36.214Z',
         file_name: 'here.txt' }]
    end

    let(:attributes) { { remote_files: remote_files } }

    it 'attaches files with spaces' 

  end

  context 'when specifying an embargo' do
    let(:remote_files) do
      [{ url: 'file:///local/file/sample_file.txt',
         expires: '2014-03-31T20:37:36.214Z',
         file_name: 'here.txt' }]
    end

    let(:attributes) do
      {
        visibility: 'embargo',
        visibility_during_embargo: 'restricted',
        embargo_release_date: '2020-06-08',
        visibility_after_embargo: 'open',
        remote_files: remote_files
      }
    end

    before do
      allow(IngestLocalFileJob).to receive(:perform_later).with(FileSet, '/local/file/sample_file.txt', user)
    end

    it 'creates works and file sets with an embargo' 

  end
end

