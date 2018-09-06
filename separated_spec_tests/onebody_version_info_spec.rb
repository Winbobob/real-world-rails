require 'rails_helper'

describe VersionInfo do
  subject do
    Module.new.tap do |mod|
      mod.extend(VersionInfo)
    end
  end

  let(:releases_response) { File.read(fixture_path.join('releases.json')) }

  describe '#current_version' do
    before do
      expect(File).to receive(:read).and_return('3.3.0')
    end

    it 'returns the current version from the VERSION file' 

  end

  describe '#latest_version' do
    context do
      let!(:releases_request) do
        stub_request(:get, 'https://api.github.com/repos/churchio/onebody/releases')
          .to_return(body: releases_response)
      end

      before do
        Rails.cache.delete('latest_version')
        @return1 = subject.latest_version
        @return2 = subject.latest_version
      end

      it 'fetches the latest version from GitHub once and caches the result' 

    end

    context 'GitHub returns an error' do
      before do
        stub_request(:get, 'https://api.github.com/repos/churchio/onebody/releases')
          .to_raise(Github::Error::BadRequest.new({}))
      end

      it 'returns nil' 

    end
  end

  describe '#up_to_date?' do
    before do
      stub_request(:get, 'https://api.github.com/repos/churchio/onebody/releases')
        .to_return(body: releases_response)
    end

    context 'given current version is 3.2.0 and latest version is 3.3.0' do
      before do
        expect(File).to receive(:read).and_return('3.2.0')
      end

      it 'returns false' 

    end

    context 'given current version is 3.3.0-pre and latest version is 3.3.0' do
      before do
        expect(File).to receive(:read).and_return('3.3.0-pre')
      end

      it 'returns false' 

    end

    context 'given current version is 3.3.0 and latest version is 3.3.0' do
      before do
        expect(File).to receive(:read).and_return('3.3.0')
      end

      it 'returns false' 

    end
  end
end

