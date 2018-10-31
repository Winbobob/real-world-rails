require 'rails_helper'

RSpec.describe Webui::MainController do
  let(:user) { create(:confirmed_user) }
  let(:admin_user) { create(:admin_user) }

  describe 'GET #sitemap' do
    render_views

    before do
      get :sitemap
      @paths = Nokogiri::XML(response.body).xpath('//xmlns:loc').map do |url|
        uri = URI.parse(url.content)
        "#{uri.path}?#{uri.query}"
      end
    end

    it { expect(@paths).to include('/main/sitemap_projects?') }
    it "have all category's urls" 

    it { expect(@paths).to include('/main/sitemap_packages/show?category=opensuse') }
  end

  describe 'GET #sitemap_projects' do
    render_views

    before do
      create(:confirmed_user)
      @projects = create_list(:project, 5)
      get :sitemap_projects
      @project_paths = Nokogiri::XML(response.body).xpath('//xmlns:loc').map { |url| URI.parse(url).path }
    end

    it "have all project's urls" 

  end

  describe 'GET #sitemap_packages' do
    render_views

    context 'without category param provided' do
      before do
        create_list(:project_with_package, 5)
        get :sitemap_packages, params: { listaction: 'show' }
        @package_paths = Nokogiri::XML(response.body).xpath('//xmlns:loc').map { |url| URI.parse(url).path }
      end

      it "have all packages's urls" 

    end

    context 'with category param provided that matches home%' do
      before do
        create(:package, project: admin_user.home_project)
        create_list(:project_with_package, 2)
        get :sitemap_packages, params: { listaction: 'show', category: admin_user.home_project_name }
        @package_paths = Nokogiri::XML(response.body).xpath('//xmlns:loc').map { |url| URI.parse(url).path }
      end

      it "doesn't have packages's urls for non home subprojects" 


      it "have packages's urls for home subprojects" 

    end

    context 'with category param provided as opensuse' do
      before do
        create(:project, name: 'openSUSE')
        create(:project_with_package, name: 'openSUSE:subproject1')
        create(:project_with_package, name: 'openSUSE:subproject2')
        get :sitemap_packages, params: { listaction: 'show', category: 'opensuse' }
        @package_paths = Nokogiri::XML(response.body).xpath('//xmlns:loc').map { |url| URI.parse(url).path }
      end

      it "doesn't have packages's urls for non openSUSE subprojects" 


      it "have packages's urls for openSUSE subprojects" 

    end
  end
end

