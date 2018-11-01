require 'spec_helper'

describe 'Awspec::Generator::Spec::Efs' do
  before do
    Awspec::Stub.load 'efs'
  end
  let(:efs) { Awspec::Generator::Spec::Efs.new }
  it 'generate_all generate spec' 

end

