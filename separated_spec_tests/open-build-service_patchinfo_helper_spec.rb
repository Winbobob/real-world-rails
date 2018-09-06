require 'rails_helper'

RSpec.describe Webui::PatchinfoHelper, type: :helper do
  describe '#patchinfo_bread_crumb' do
    let(:project) { create(:project_with_package) }

    before do
      @project = project.name
      @package = project.packages.first.name
    end

    it 'creates a list of project_bread_crumb links, link to the patchinfo package' 


    it 'the parameter content to the list' 

  end
end

