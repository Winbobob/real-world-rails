require 'spec_helper'

describe Admin::ServicesController do
  let(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'GET #edit' do
    let!(:project) { create(:project) }

    Service.available_services_names.each do |service_name|
      context "#{service_name}" do
        let!(:service) do
          service_template = service_name.concat("_service").camelize.constantize
          service_template.where(template: true).first_or_create
        end

        it 'successfully displays the template' 

      end
    end
  end

  describe "#update" do
    let(:project) { create(:project) }
    let!(:service) do
      RedmineService.create(
        project: project,
        active: false,
        template: true,
        properties: {
          project_url: 'http://abc',
          issues_url: 'http://abc',
          new_issue_url: 'http://abc'
        }
      )
    end

    it 'calls the propagation worker when service is active' 


    it 'does not call the propagation worker when service is not active' 

  end
end

