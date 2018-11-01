require 'spec_helper'

describe 'Awspec::Generator::Spec::Rds' do
  before do
    Awspec::Stub.load 'rds'
  end
  let(:rds) { Awspec::Generator::Spec::Rds.new }
  it 'generate_by_vpc_id generate spec' 

  it { should have_db_parameter_group('custom.mysql5.6').parameter_apply_status('in-sync') }
  it { should have_option_group('default:mysql-5-6').status('in-sync') }
  it { should have_option_group('custom:mysql-5-6').status('in-sync') }
end
EOF
    expect(rds.generate_by_vpc_id('my-vpc').to_s.gsub(/\n/, "\n")).to eq spec
  end
end

