require 'spec_helper'

describe 'Awspec::Generator::Spec::Directconnect' do
  before do
    Awspec::Stub.load 'directconnect_virtual_interface'
  end
  let(:directconnect) { Awspec::Generator::Spec::Directconnect.new }
  it 'generate_by_vpc_id generate spec' 

end

