require 'spec_helper'

describe 'environments routing' do
  let(:project) { create(:project) }

  let(:environment) do
    create(:environment, project: project,
                         name: 'staging-1.0/review')
  end

  let(:environments_route) do
    "#{project.namespace.name}/#{project.name}/environments/"
  end

  describe 'routing environment folders' do
    context 'when using JSON format' do
      it 'correctly matches environment name and JSON format' 

    end

    context 'when using HTML format' do
      it 'correctly matches environment name and HTML format' 

    end

    context 'when using implicit format' do
      it 'correctly matches environment name' 

    end
  end

  def get_folder(folder)
    get("#{project.namespace.name}/#{project.name}/" \
        "environments/folders/#{folder}")
  end

  def folder_action(**opts)
    options = { namespace_id: project.namespace.name,
                project_id: project.name }

    ['projects/environments#folder', options.merge(opts)]
  end
end

