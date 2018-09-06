require 'spec_helper'

describe 'sysctl::before' do
  let(:title) { 'sysctl::before' }
  let(:params) { { :value => "title" } }

  it "Should raise an error about needing the sysctl::common class" 

end

describe 'sysctl::before' do
  let(:title) { 'test define' }
  let(:pre_condition) {
    [ '# we need sysctl common',
      'class {"sysctl::common":}' ] }
  let(:params) { { :value => "title" } }

  it { should create_sysctl__before('test define').with_value("title") }

  it { should contain_class("sysctl::common") }

end

