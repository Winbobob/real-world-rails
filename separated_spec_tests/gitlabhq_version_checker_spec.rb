require 'spec_helper'
include ImportExport::CommonUtil

describe Gitlab::ImportExport::VersionChecker do
  let(:shared) { Gitlab::ImportExport::Shared.new(nil) }

  describe 'bundle a project Git repo' do
    let(:version) { Gitlab::ImportExport.version }

    before do
      allow_any_instance_of(Gitlab::ImportExport::Shared).to receive(:relative_archive_path).and_return('')
      allow(File).to receive(:open).and_return(version)
    end

    it 'returns true if Import/Export have the same version' 


    context 'newer version' do
      let(:version) { '900.0'}

      it 'returns false if export version is newer' 


      it 'shows the correct error message' 

    end
  end

  describe 'version file access check' do
    it 'does not read a symlink' 

  end
end

