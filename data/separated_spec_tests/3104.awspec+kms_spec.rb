require 'spec_helper'

describe 'Awspec::Generator::Spec::Kms' do
  before do
    Awspec::Stub.load 'kms'
  end
  let(:kms) { Awspec::Generator::Spec::Kms.new }
  it 'generate_all generate spec' 

end

