require 'spec_helper'

describe 'Awspec::Generator::Spec::Route53HostedZone' do
  before do
    Awspec::Stub.load 'route53_hosted_zone'
  end
  let(:route53_hosted_zone) { Awspec::Generator::Spec::Route53HostedZone.new }
  it 'generate_by_domain_name generate spec' 

end

