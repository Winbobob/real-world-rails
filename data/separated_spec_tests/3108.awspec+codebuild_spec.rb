require 'spec_helper'

describe 'Awspec::Generator::Spec::Codebuild' do
  before do
    Awspec::Stub.load 'codebuild'
  end
  let(:codebuild) { Awspec::Generator::Spec::Codebuild.new }
  it 'generate_all generate spec' 

end

