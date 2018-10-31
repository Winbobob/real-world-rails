# frozen_string_literal: true

require 'rails_helper'
require 'fileutils'

describe IngestFileJob do
  context 'when adding a new version', unless: external_files? do
    let(:user)     { create(:user) }
    let(:file_set) { create(:file_set, :with_png, depositor: user.login) }
    let(:filepath) { File.join(fixture_path, 'world.png') }

    before do
      allow(CharacterizeJob).to receive(:perform_later)
    end

    it "updates the file set's title with the file name" 

  end

  context 'fedora external content', if: external_files? do
    let(:user)     { create(:user) }
    let(:file_set) { create(:file_set, :with_png, depositor: user.login, id: 'mst3kabc') }
    let(:filepath) { File.join(fixture_path, 'world.png') }

    before do
      allow(CharacterizeJob).to receive(:perform_later)
      described_class.perform_now(file_set, filepath, user)
    end

    after do
      file_set.delete
      file_set.eradicate
      if Rails.env.test?
        FileUtils.rm_rf(ENV['REPOSITORY_FILESTORE'])
      end
    end

    it 'redirects to the url of the binary payload' 


    it 'checks to make sure that the file_set content is a PNG' 

  end
end

