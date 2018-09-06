require 'spec_helper'

describe Projects::RawController do
  let(:public_project) { create(:project, :public, :repository) }

  describe '#show' do
    context 'regular filename' do
      let(:id) { 'master/README.md' }

      it 'delivers ASCII file' 

    end

    context 'image header' do
      let(:id) { 'master/files/images/6049019_460s.jpg' }

      it 'sets image content type header' 

    end

    context 'lfs object' do
      let(:id) { 'be93687/files/lfs/lfs_object.iso' }
      let!(:lfs_object) { create(:lfs_object, oid: '91eff75a492a3ed0dfcb544d7f31326bc4014c8551849c192fd1e48d4dd2c897', size: '1575078') }

      context 'when lfs is enabled' do
        before do
          allow_any_instance_of(Project).to receive(:lfs_enabled?).and_return(true)
        end

        context 'when project has access' do
          before do
            public_project.lfs_objects << lfs_object
            allow_any_instance_of(LfsObjectUploader).to receive(:exists?).and_return(true)
            allow(controller).to receive(:send_file) { controller.head :ok }
          end

          it 'serves the file' 


          context 'and lfs uses object storage' do
            let(:lfs_object) { create(:lfs_object, :with_file, oid: '91eff75a492a3ed0dfcb544d7f31326bc4014c8551849c192fd1e48d4dd2c897', size: '1575078') }

            before do
              stub_lfs_object_storage
              lfs_object.file.migrate!(LfsObjectUploader::Store::REMOTE)
            end

            it 'responds with redirect to file' 


            it 'sets content disposition' 

          end
        end

        context 'when project does not have access' do
          it 'does not serve the file' 

        end
      end

      context 'when lfs is not enabled' do
        before do
          allow_any_instance_of(Project).to receive(:lfs_enabled?).and_return(false)
        end

        it 'delivers ASCII file' 

      end
    end
  end

  def get_show(project, id)
    get(:show, namespace_id: project.namespace.to_param,
               project_id: project,
               id: id)
  end
end

