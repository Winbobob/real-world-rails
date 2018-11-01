require 'spec_helper'

describe 'Awspec::Generator::Spec::RouteTable' do
  before do
    Awspec::Stub.load 'route_table'
  end
  let(:route_table) { Awspec::Generator::Spec::RouteTable.new }
  it 'generate_by_vpc_id generate spec' 

end

