require_relative '../../../spec_helper_min'
require_relative '../../../support/helpers'
require_relative '../../../factories/organizations_contexts'

describe Carto::Superadmin::OrganizationsController do
  include HelperMethods

  let(:superadmin_headers) do
    credentials = Cartodb.config[:superadmin]
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials(
        credentials['username'],
        credentials['password']
      ),
      'HTTP_ACCEPT' => "application/json"
    }
  end

  let(:invalid_headers) do
    {
      'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('not', 'trusworthy'),
      'HTTP_ACCEPT' => "application/json"
    }
  end

  describe '#usage' do
    include_context 'organization with users helper'

    it 'fails without authorization' 


    shared_examples_for 'dataservices usage metrics' do
      before(:each) do
        @date = Date.today
        usage_metrics = @class.new(@org_user_owner.username, @organization.name, MockRedis.new)
        @class.stubs(:new).returns(usage_metrics)
        usage_metrics.incr(@service, :success_responses, 10, @date)
        usage_metrics.incr(@service, :success_responses, 100, @date - 2)
        usage_metrics.incr(@service, :empty_responses, 20, @date - 2)
        usage_metrics.incr(@service, :failed_responses, 30, @date - 1)
        usage_metrics.incr(@service, :total_requests, 40, @date)
      end

      it 'returns usage metrics' 


      it 'returns totals' 

    end

    describe 'geocoder_internal' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_internal
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_here' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_here
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_google' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_google
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_cache' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_cache
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_mapzen' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_mapzen
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_mapbox' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_mapbox
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'geocoder_tomtom' do
      before(:all) do
        @class = CartoDB::GeocoderUsageMetrics
        @service = :geocoder_tomtom
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'here_isolines' do
      before(:all) do
        @class = CartoDB::IsolinesUsageMetrics
        @service = :here_isolines
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'mapzen_isolines' do
      before(:all) do
        @class = CartoDB::IsolinesUsageMetrics
        @service = :mapzen_isolines
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'mapbox_isolines' do
      before(:all) do
        @class = CartoDB::IsolinesUsageMetrics
        @service = :mapbox_isolines
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'tomtom_isolines' do
      before(:all) do
        @class = CartoDB::IsolinesUsageMetrics
        @service = :tomtom_isolines
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'obs_general' do
      before(:all) do
        @class = CartoDB::ObservatoryGeneralUsageMetrics
        @service = :obs_general
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'obs_snapshot' do
      before(:all) do
        @class = CartoDB::ObservatorySnapshotUsageMetrics
        @service = :obs_snapshot
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'routing_mapzen' do
      before(:all) do
        @class = CartoDB::RoutingUsageMetrics
        @service = :routing_mapzen
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'routing_mapbox' do
      before(:all) do
        @class = CartoDB::RoutingUsageMetrics
        @service = :routing_mapbox
      end

      it_behaves_like 'dataservices usage metrics'
    end

    describe 'routing_tomtom' do
      before(:all) do
        @class = CartoDB::RoutingUsageMetrics
        @service = :routing_tomtom
      end

      it_behaves_like 'dataservices usage metrics'
    end

    it 'returns mapviews' 


    it 'returns Twitter imports' 


    it 'does not return data outside the date range' 


    it 'returns only requested services' 


    it 'returns an error for invalid services array format' 


    it 'returns an error for invalid date format' 


    it 'returns an error for unknown organization' 

  end
end

