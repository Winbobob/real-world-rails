require 'rails_helper'
# WARNING: If you change owner tests make sure you uncomment this line
# and start a test backend. Some of the Owner methods
# require real backend answers for projects/packages.
# CONFIG['global_write_through'] = true

RSpec.describe Webui::SearchController, vcr: true do
  let!(:user) { create(:confirmed_user, login: 'Iggy') }
  let!(:develuser) { create(:confirmed_user, login: 'DevelIggy') }
  let!(:package) { create(:package, name: 'TestPack', project: Project.find_by(name: 'home:Iggy')) }
  let!(:develpackage) { create(:package, name: 'DevelPack', project: Project.find_by(name: 'home:DevelIggy')) }
  let!(:owner_attrib) { create(:attrib, attrib_type: AttribType.where(name: 'OwnerRootProject').first, project: Project.find_by(name: 'home:Iggy')) }

  describe 'GET #owner' do
    it 'just returns with blank search text' 


    it 'warns about short search text' 


    it 'assigns results' 


    it 'assigns results for devel package' 

  end

  describe 'GET #search' do
    it 'just returns without search text' 


    context 'with a short search text' do
      before do
        get :index, params: { search_text: 'a' }
      end

      it { expect(flash[:error]).to eq('Search string must contain at least two characters.') }
      it { expect(response).to have_http_status(:success) }
    end

    context 'request number when string starts with a #' do
      before do
        get :index, params: { search_text: '#1' }
      end

      it { is_expected.to redirect_to(controller: :request, action: :show, number: 1) }
    end

    context 'with search_text starting with obs://' do
      context 'and a package' do
        before do
          allow(Package).to receive(:exists_by_project_and_name).and_return(true)
          get :index, params: { search_text: "obs://build.opensuse.org/#{user.home_project.name}/i586/1-#{package.name}" }
        end

        it { is_expected.to redirect_to(controller: :package, action: :show, project: user.home_project, package: package.name, rev: 1) }
      end

      context 'and a non existent package' do
        before do
          request.env['HTTP_REFERER'] = root_url # Needed for the redirect_to :back
          get :index, params: { search_text: "obs://build.opensuse.org/#{user.home_project.name}/i586/1-non_existent_package" }
        end

        it { expect(flash[:notice]).to eq('Sorry, this disturl does not compute...') }
        it { is_expected.to redirect_to(root_url) }
      end
    end

    context 'with no search scope' do
      before do
        get :index, params: { search_text: 'whatever' }
      end

      it { expect(flash[:error]).to eq('You have to search for whatever in something. Click the advanced button...') }
      it { expect(response).to have_http_status(:success) }
    end

    context 'with proper parameters but no results' do
      before do
        allow(ThinkingSphinx).to receive(:search).and_return([])
        get :index, params: { search_text: 'whatever', project: 1, package: 1, name: 1 }
      end

      it { expect(flash[:notice]).to eq('Your search did not return any results.') }
      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:results)).to be_empty }
    end

    context 'with proper parameters and some results' do
      before do
        allow(ThinkingSphinx).to receive(:search).and_return(["Fake result with #{package.name}"])
        get :index, params: { search_text: package.name, project: 1, package: 1, name: 1 }
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:results)).not_to be_empty }
    end
  end
end
