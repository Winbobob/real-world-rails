require 'spec_helper'

describe Projects::PagesDomainsController do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let!(:pages_domain) { create(:pages_domain, project: project) }

  let(:request_params) do
    {
      namespace_id: project.namespace,
      project_id: project
    }
  end

  let(:pages_domain_params) do
    build(:pages_domain, domain: 'my.otherdomain.com').slice(:key, :certificate, :domain)
  end

  before do
    allow(Gitlab.config.pages).to receive(:enabled).and_return(true)
    sign_in(user)
    project.add_maintainer(user)
  end

  describe 'GET show' do
    it "displays the 'show' page" 

  end

  describe 'GET new' do
    it "displays the 'new' page" 

  end

  describe 'POST create' do
    it "creates a new pages domain" 

  end

  describe 'GET edit' do
    it "displays the 'edit' page" 

  end

  describe 'PATCH update' do
    before do
      controller.instance_variable_set(:@domain, pages_domain)
    end

    let(:pages_domain_params) do
      attributes_for(:pages_domain).slice(:key, :certificate)
    end

    let(:params) do
      request_params.merge(id: pages_domain.domain, pages_domain: pages_domain_params)
    end

    it 'updates the domain' 


    it 'redirects to the project page' 


    context 'the domain is invalid' do
      it 'renders the edit action' 

    end

    context 'the parameters include the domain' do
      it 'renders 400 Bad Request' 

    end
  end

  describe 'POST verify' do
    let(:params) { request_params.merge(id: pages_domain.domain) }

    def stub_service
      service = double(:service)

      expect(VerifyPagesDomainService).to receive(:new) { service }

      service
    end

    it 'handles verification success' 


    it 'handles verification failure' 


    it 'returns a 404 response for an unknown domain' 

  end

  describe 'DELETE destroy' do
    it "deletes the pages domain" 

  end

  context 'pages disabled' do
    before do
      allow(Gitlab.config.pages).to receive(:enabled).and_return(false)
    end

    describe 'GET show' do
      it 'returns 404 status' 

    end

    describe 'GET new' do
      it 'returns 404 status' 

    end

    describe 'POST create' do
      it "returns 404 status" 

    end

    describe 'DELETE destroy' do
      it "deletes the pages domain" 

    end
  end
end

