require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "a QualityMetricsController" do
  let(:user) { User.make! }

  describe "vote" do
    let(:o) { Observation.make! }

    describe "route" do
      it "should accept POST requests" 

      it "should accept POST requests" 

    end

    it "should create a QualityMetric in response to POST" 

    it "should set agree to true if true" 

    it "should set agree to false if false" 

    it "should destroy an existing QualityMetric in response to DELETE" 


    describe "elastic index" do
      before(:each) { enable_elastic_indexing( Observation ) }
      after(:each) { disable_elastic_indexing( Observation ) }

      it "should get the updated quality_grade" 

    end
  end

end

describe QualityMetricsController, "oauth authentication" do
  let(:token) do
    double acceptable?: true,
      accessible?: true,
      resource_owner_id: user.id,
      application: OauthApplication.make!
  end
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer xxx"
    allow(controller).to receive(:doorkeeper_token) { token }
  end
  it_behaves_like "a QualityMetricsController"
end

describe QualityMetricsController, "devise authentication" do
  before { http_login(user) }
  it_behaves_like "a QualityMetricsController"
end

