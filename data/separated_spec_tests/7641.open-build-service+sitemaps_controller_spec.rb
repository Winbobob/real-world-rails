require 'rails_helper'

RSpec.describe Webui::SitemapsController do
  let(:paths) { Nokogiri::XML(response.body, &:strict).xpath('//xmlns:loc').map { |url| URI.parse(url.content).path } }

  describe 'GET #index' do
    render_views

    before do
      get :index
    end

    it { expect(paths).to include('/project/sitemap') }
    it { expect(paths).to include('/package/sitemap/main') }
    it { expect(paths).to include('/package/sitemap/opensuse') }

    it "includes all packages' home URLs" 

  end

  describe 'GET #projects' do
    render_views

    let!(:projects) { create_list(:project, 2) }

    before do
      get :projects
    end

    it "includes main's index URL" 


    it "includes all projects' show URLs" 

  end

  describe 'GET #packages' do
    render_views

    context 'when the project_name param is not provided' do
      let!(:packages) { create_list(:package, 2) }
      let!(:excluded_packages) do
        [
          create(:project_with_package, name: 'home:abc123'),
          create(:project_with_package, name: 'DISCONTINUED:something'),
          create(:project_with_package, name: 'openSUSE:subproject1')
        ].map(&:packages).flatten
      end

      before do
        get :packages
      end

      it "has all packages' show URLs for non home/openSUSE/DISCONTINUED subprojects" 


      it "doesn't have packages' show URLs for home/openSUSE/DISCONTINUED subprojects" 

    end

    context 'when the project_name param matches home%' do
      let(:admin_user) { create(:admin_user) }
      let!(:packages) { create_list(:package, 2, project: admin_user.home_project) }
      let!(:excluded_packages) { create_list(:package, 2) }

      before do
        get :packages, params: { project_name: admin_user.home_project_name }
      end

      it "has packages' show URLs for home subprojects" 


      it "doesn't have packages' show URLs for non home subprojects" 

    end

    context 'when the project_name param is opensuse' do
      let!(:packages) do
        [
          create(:project_with_package, name: 'openSUSE:subproject1'),
          create(:project_with_package, name: 'openSUSE:subproject2')
        ].map(&:packages).flatten
      end
      let!(:excluded_packages) { create_list(:package, 2) }

      before do
        get :packages, params: { project_name: 'opensuse' }
      end

      it "has packages' show URLs for openSUSE subprojects" 


      it "doesn't have packages' show URLs for non openSUSE subprojects" 

    end
  end
end

