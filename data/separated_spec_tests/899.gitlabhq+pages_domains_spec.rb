require 'rails_helper'

describe API::PagesDomains do
  set(:project) { create(:project, path: 'my.project', pages_https_only: false) }
  set(:user) { create(:user) }
  set(:admin) { create(:admin) }

  set(:pages_domain) { create(:pages_domain, :without_key, :without_certificate, domain: 'www.domain.test', project: project) }
  set(:pages_domain_secure) { create(:pages_domain, domain: 'ssl.domain.test', project: project) }
  set(:pages_domain_expired) { create(:pages_domain, :with_expired_certificate, domain: 'expired.domain.test', project: project) }

  let(:pages_domain_params) { build(:pages_domain, :without_key, :without_certificate, domain: 'www.other-domain.test').slice(:domain) }
  let(:pages_domain_secure_params) { build(:pages_domain, domain: 'ssl.other-domain.test', project: project).slice(:domain, :certificate, :key) }
  let(:pages_domain_secure_key_missmatch_params) {build(:pages_domain, :with_trusted_chain, project: project).slice(:domain, :certificate, :key) }
  let(:pages_domain_secure_missing_chain_params) {build(:pages_domain, :with_missing_chain, project: project).slice(:certificate) }

  let(:route) { "/projects/#{project.id}/pages/domains" }
  let(:route_domain) { "/projects/#{project.id}/pages/domains/#{pages_domain.domain}" }
  let(:route_domain_path) { "/projects/#{project.full_path.gsub('/', '%2F')}/pages/domains/#{pages_domain.domain}" }
  let(:route_secure_domain) { "/projects/#{project.id}/pages/domains/#{pages_domain_secure.domain}" }
  let(:route_expired_domain) { "/projects/#{project.id}/pages/domains/#{pages_domain_expired.domain}" }
  let(:route_vacant_domain) { "/projects/#{project.id}/pages/domains/www.vacant-domain.test" }

  before do
    allow(Gitlab.config.pages).to receive(:enabled).and_return(true)
  end

  describe 'GET /pages/domains' do
    context 'when pages is disabled' do
      before do
        allow(Gitlab.config.pages).to receive(:enabled).and_return(false)
      end

      it_behaves_like '404 response' do
        let(:request) { get api('/pages/domains', admin) }
      end
    end

    context 'when pages is enabled' do
      context 'when authenticated as an admin' do
        it 'returns paginated all pages domains' 

      end

      context 'when authenticated as a non-member' do
        it_behaves_like '403 response' do
          let(:request) { get api('/pages/domains', user) }
        end
      end
    end
  end

  describe 'GET /projects/:project_id/pages/domains' do
    shared_examples_for 'get pages domains' do
      it 'returns paginated pages domains' 

    end

    context 'when pages is disabled' do
      before do
        allow(Gitlab.config.pages).to receive(:enabled).and_return(false)
        project.add_maintainer(user)
      end

      it_behaves_like '404 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'get pages domains'
    end

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is a reporter' do
      before do
        project.add_reporter(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is not a member' do
      it_behaves_like '404 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe 'GET /projects/:project_id/pages/domains/:domain' do
    shared_examples_for 'get pages domain' do
      it 'returns pages domain' 


      it 'returns pages domain with project path' 


      it 'returns pages domain with a certificate' 


      it 'returns pages domain with an expired certificate' 

    end

    context 'when domain is vacant' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like '404 response' do
        let(:request) { get api(route_vacant_domain, user) }
      end
    end

    context 'when user is a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'get pages domain'
    end

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is a reporter' do
      before do
        project.add_reporter(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { get api(route, user) }
      end
    end

    context 'when user is not a member' do
      it_behaves_like '404 response' do
        let(:request) { get api(route, user) }
      end
    end
  end

  describe 'POST /projects/:project_id/pages/domains' do
    let(:params) { pages_domain_params.slice(:domain) }
    let(:params_secure) { pages_domain_secure_params.slice(:domain, :certificate, :key) }

    shared_examples_for 'post pages domains' do
      it 'creates a new pages domain' 


      it 'creates a new secure pages domain' 


      it 'fails to create pages domain without key' 


      it 'fails to create pages domain with key missmatch' 

    end

    context 'when user is a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'post pages domains'
    end

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it_behaves_like '403 response' do
        let(:request) { post api(route, user), params }
      end
    end

    context 'when user is a reporter' do
      before do
        project.add_reporter(user)
      end

      it_behaves_like '403 response' do
        let(:request) { post api(route, user), params }
      end
    end

    context 'when user is a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { post api(route, user), params }
      end
    end

    context 'when user is not a member' do
      it_behaves_like '404 response' do
        let(:request) { post api(route, user), params }
      end
    end
  end

  describe 'PUT /projects/:project_id/pages/domains/:domain' do
    let(:params_secure) { pages_domain_secure_params.slice(:certificate, :key) }
    let(:params_secure_nokey) { pages_domain_secure_params.slice(:certificate) }

    shared_examples_for 'put pages domain' do
      it 'updates pages domain removing certificate' 


      it 'updates pages domain adding certificate' 


      it 'updates pages domain with expired certificate' 


      it 'updates pages domain with expired certificate not updating key' 


      it 'fails to update pages domain adding certificate without key' 


      it 'fails to update pages domain adding certificate with missing chain' 


      it 'fails to update pages domain with key missmatch' 

    end

    context 'when domain is vacant' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like '404 response' do
        let(:request) { put api(route_vacant_domain, user) }
      end
    end

    context 'when user is a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'put pages domain'
    end

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it_behaves_like '403 response' do
        let(:request) { put api(route_domain, user) }
      end
    end

    context 'when user is a reporter' do
      before do
        project.add_reporter(user)
      end

      it_behaves_like '403 response' do
        let(:request) { put api(route_domain, user) }
      end
    end

    context 'when user is a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { put api(route_domain, user) }
      end
    end

    context 'when user is not a member' do
      it_behaves_like '404 response' do
        let(:request) { put api(route_domain, user) }
      end
    end
  end

  describe 'DELETE /projects/:project_id/pages/domains/:domain' do
    shared_examples_for 'delete pages domain' do
      it 'deletes a pages domain' 

    end

    context 'when domain is vacant' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like '404 response' do
        let(:request) { delete api(route_vacant_domain, user) }
      end
    end

    context 'when user is a maintainer' do
      before do
        project.add_maintainer(user)
      end

      it_behaves_like 'delete pages domain'
    end

    context 'when user is a developer' do
      before do
        project.add_developer(user)
      end

      it_behaves_like '403 response' do
        let(:request) { delete api(route_domain, user) }
      end
    end

    context 'when user is a reporter' do
      before do
        project.add_reporter(user)
      end

      it_behaves_like '403 response' do
        let(:request) { delete api(route_domain, user) }
      end
    end

    context 'when user is a guest' do
      before do
        project.add_guest(user)
      end

      it_behaves_like '403 response' do
        let(:request) { delete api(route_domain, user) }
      end
    end

    context 'when user is not a member' do
      it_behaves_like '404 response' do
        let(:request) { delete api(route_domain, user) }
      end
    end
  end
end

