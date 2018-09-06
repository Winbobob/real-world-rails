# frozen_string_literal: true

require 'rails_helper'

describe CollectionZipService do
  describe '#call' do
    subject(:zip_file_name) { service.call }

    let(:service) { described_class.new(collection, user) }
    let(:zip_file) { ::Zip::File.new(zip_file_name) }
    let(:user) { create(:user) }

    after do
      File.delete(zip_file_name)
    end

    context 'with an empty collection' do
      let(:collection) { build(:collection, title: ['An Empty Collection'], depositor: user.login) }

      it 'creates a zip' 

    end

    context 'with a different location' do
      let(:service) { described_class.new(collection, user, '/tmp') }
      let(:collection) { build(:collection, title: ['An Empty Collection'], depositor: user.login) }

      it 'creates a zip' 

    end

    context 'with a collection containing works' do
      let(:collection) { build(:collection, title: ['Collection with Works'], depositor: user.login) }
      let(:work1) { create :public_work, title: ['First Work'], depositor: user.login }
      let(:work2) { create :public_work, title: ['Second Work'], depositor: user.login }
      let(:work3) { create :private_work, title: ['Private Work'], depositor: create(:user).login }

      before do
        collection.ordered_members = [work1, work2, work3]
        collection.save
      end

      it 'creates a zip and filters the files we do not have access to read' 

    end

    context 'with existing zip files' do
      let(:collection) { build(:collection, title: ['Collection with Works'], depositor: user.login) }
      let(:work1) { create :public_work, title: ['First Work'], depositor: user.login }

      before do
        collection.ordered_members = [work1]
        collection.save
        FileUtils.touch('tmp/first_work.zip')
      end

      it 'recreates the zip file' 

    end
  end
end

