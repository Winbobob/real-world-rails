require 'carto/saml_service'
require 'spec_helper_min'

describe Carto::SamlService do
  let(:service) do
    Carto::SamlService.new(@organization)
  end

  before(:each) do
    @organization = FactoryGirl.create(:saml_organization)
  end

  after(:each) do
    @organization.delete
  end

  describe 'configuration support' do
    it 'is disabled if there is no configuration or it is empty' 


    it 'is enabled if there is configuration' 


    it 'email_attribute doesnt return the default value if its defined' 

  end

  describe 'Integration logic' do
    # This stubs the SAML external integration
    let(:response_mock) { mock }
    let(:saml_response_param_mock) { mock }
    let(:saml_config) { @organization.auth_saml_configuration }

    before(:each) do
      Cartodb.stubs(:config).returns(saml_authentication: saml_config)
      service.stubs(:get_saml_response).returns(response_mock)
      service.stubs(:debug_response)
    end

    describe '#get_user_email' do
      it 'returns nil if response is invalid' 


      it 'returns nil if response lacks email' 


      it 'returns the user with matching email' 

    end

    def create_test_saml_user
      ::User.any_instance.stubs(:after_create).returns(true)
      FactoryGirl.create(:carto_user)
    end
  end
end

