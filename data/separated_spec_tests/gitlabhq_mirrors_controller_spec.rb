require 'spec_helper'

describe Projects::MirrorsController do
  include ReactiveCachingHelpers

  describe 'setting up a remote mirror' do
    set(:project) { create(:project, :repository) }

    context 'when the current project is not a mirror' do
      it 'allows to create a remote mirror' 

    end
  end

  describe '#update' do
    let(:project) { create(:project, :repository, :remote_mirror) }

    before do
      sign_in(project.owner)
    end

    around do |example|
      Sidekiq::Testing.fake! { example.run }
    end

    context 'With valid URL for a push' do
      let(:remote_mirror_attributes) do
        { "0" => { "enabled" => "0", url: 'https://updated.example.com' } }
      end

      it 'processes a successful update' 


      it 'should create a RemoteMirror object' 

    end

    context 'With invalid URL for a push' do
      let(:remote_mirror_attributes) do
        { "0" => { "enabled" => "0", url: 'ftp://invalid.invalid' } }
      end

      it 'processes an unsuccessful update' 


      it 'should not create a RemoteMirror object' 

    end
  end

  def do_put(project, options, extra_attrs = {})
    attrs = extra_attrs.merge(namespace_id: project.namespace.to_param, project_id: project.to_param)
    attrs[:project] = options

    put :update, attrs
  end
end

