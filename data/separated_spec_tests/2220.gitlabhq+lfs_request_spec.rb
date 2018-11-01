require 'spec_helper'

describe LfsRequest do
  include ProjectForksHelper

  controller(Projects::GitHttpClientController) do
    # `described_class` is not available in this context
    include LfsRequest # rubocop:disable RSpec/DescribedClass

    def show
      storage_project

      render nothing: true
    end

    def project
      @project ||= Project.find(params[:id])
    end

    def download_request?
      true
    end

    def ci?
      false
    end
  end

  let(:project) { create(:project, :public) }

  before do
    stub_lfs_setting(enabled: true)
  end

  describe '#storage_project' do
    it 'assigns the project as storage project' 


    it 'assigns the source of a forked project' 

  end
end

