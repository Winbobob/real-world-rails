require 'rails_helper'
# WARNING: Some tests require real backend answers, so make sure you uncomment
# this line and start a test backend.
# CONFIG['global_write_through'] = true

RSpec.describe SourceController, vcr: true do
  let(:user) { create(:confirmed_user, login: 'tom') }
  let(:project) { user.home_project }

  describe 'POST #global_command_orderkiwirepos' do
    it 'is accessible anonymously and forwards backend errors' 

  end

  describe 'POST #global_command_branch' do
    it 'is not accessible anonymously' 

  end

  describe 'POST #global_command_createmaintenanceincident' do
    it 'is not accessible anonymously' 

  end

  describe 'POST #package_command' do
    let(:multibuild_package) { create(:package, name: 'multibuild') }
    let(:multibuild_project) { multibuild_package.project }
    let(:repository) { create(:repository) }
    let(:target_repository) { create(:repository) }

    before do
      multibuild_project.repositories << repository
      project.repositories << target_repository
      login user
    end

    context "with 'diff' command for a multibuild package" do
      before do
        post :package_command, params: {
          cmd: 'diff', package: "#{multibuild_package.name}:one", project: multibuild_project, target_project: project
        }
      end

      it { expect(flash[:error]).to eq("invalid_package_name(invalid package name '#{multibuild_package.name}:one'): ") }
      it { expect(response.status).to eq(302) }
    end
  end
end
