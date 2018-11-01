# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Material::ZipDownloadService do
  let(:instance) { Instance.default }
  with_tenant(:instance) do
    # Folder hierarchy:
    #      f_a
    #   /   |   \
    # f_b  f_c  m_a
    #  |    |
    # m_b  f_d
    #       |
    #      m_d
    let(:folder_a) { create(:folder) }
    let(:folder_b) { create(:folder, parent: folder_a) }
    let(:folder_c) { create(:folder, parent: folder_a) }
    let(:folder_d) { create(:folder, parent: folder_c) }
    let(:material_a) { create(:material, folder: folder_a) }
    let(:material_b) { create(:material, folder: folder_b) }
    let(:material_d) { create(:material, folder: folder_d) }
    let(:materials) { [material_a, material_b, material_d] }
    let(:service) { Course::Material::ZipDownloadService.send(:new, folder_a, materials) }

    describe '#download_to_base_dir' do
      let(:dir) { service.instance_variable_get(:@base_dir) }
      subject { service.send(:download_to_base_dir) }

      before { subject }
      context 'when all of the materials are given' do
        it 'downloads the materials' 


        it 'keeps the folder hierarchy' 

      end

      context 'when some of the materials are selected' do
        let(:service) do
          Course::Material::ZipDownloadService.send(:new, folder_a, [material_a, material_b])
        end

        it 'only downloads the selected materials' 

      end
    end

    describe '#zip_base_dir' do
      let!(:dir) do
        service.send(:download_to_base_dir)
        service.instance_variable_get(:@base_dir)
      end
      subject { service.send(:zip_base_dir) }

      it 'zips the directory' 

    end

    describe '.download_and_zip' do
      subject { Course::Material::ZipDownloadService.download_and_zip(folder_a, materials) }

      it 'downloads and zips the folder' 

    end
  end
end

