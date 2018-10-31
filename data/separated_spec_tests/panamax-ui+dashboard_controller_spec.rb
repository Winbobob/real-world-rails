require 'spec_helper'

describe DashboardController do
  let(:response) { double('response', response: []) }
  let(:resources) do
    {
        'Application' => { count: 1, manage_path: apps_path, title: 'test', message: 'test' },
        'Source' => { count: 1, manage_path: template_repos_path, title: 'test', message: 'test'  },
        'Image' => { count: 1, manage_path: images_path, title: 'test', message: 'test'  },
        'Registry' => { count: 1, manage_path: registries_path, title: 'test', message: 'test'  },
        'DeploymentTarget' => { count: 1, manage_path: deployment_targets_path, title: 'test', message: 'test'  }
    }
  end

  before do
    allow(I18n).to receive(:t).and_return('test')
  end

  describe 'GET #index' do
    it 'assigns values to the resources instance variable' 


    it 'the map of resources contains expected keys' 

  end
end

