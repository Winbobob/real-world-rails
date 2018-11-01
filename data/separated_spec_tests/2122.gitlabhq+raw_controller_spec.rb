require 'spec_helper'

describe Projects::RawController do
  let(:project) { create(:project, :public, :repository) }

  describe 'GET #show' do
    subject do
      get(:show,
          namespace_id: project.namespace,
          project_id: project,
          id: filepath)
    end

    context 'regular filename' do
      let(:filepath) { 'master/README.md' }

      it 'delivers ASCII file' 

    end

    context 'image header' do
      let(:filepath) { 'master/files/images/6049019_460s.jpg' }

      it 'sets image content type header' 

    end

    it_behaves_like 'repository lfs file load' do
      let(:filename) { 'lfs_object.iso' }
      let(:filepath) { "be93687/files/lfs/#{filename}" }
    end
  end
end

