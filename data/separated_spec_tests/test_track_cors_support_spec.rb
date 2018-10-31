require 'rails_helper'

RSpec.describe CorsSupport, type: :concern do
  let(:cors_controller_class) { Class.new(UnauthenticatedApiController) { include CorsSupport } }
  subject { cors_controller_class.new }

  before(:each) do
    # HTTP_ORIGIN includes protocol and host
    allow(subject).to receive(:origin).and_return("https://my.domain.tld")
  end

  def allow_hosts(hosts)
    allow(subject).to receive(:whitelisted_hosts).and_return(hosts.join(','))
  end

  describe "cors_support" do
    it "allows from identical URI" 


    it "allows from identical host" 


    it "allows from matching, partial host" 


    it "allows if any one domain matches" 


    it "denies if no domain matches" 

  end
end

