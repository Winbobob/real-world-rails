require 'spec_helper'

describe 'test::bare_class' do
  describe 'rspec group' do
    it 'should have a catalogue method' 


    it 'subject should return a catalogue' 


    describe 'derivative group' do
      subject { catalogue.resource('Notify', 'foo') }

      it 'can redefine subject' 

    end
  end

  describe 'coverage' do
    it 'class should be included in the coverage filter' 


    # file and line information was only added to resources created with
    # ensure_resource() in 4.6.0 (PUP-6530).
    if Puppet::Util::Package.versioncmp(Puppet.version, '4.6.0') >= 0
      it 'should not include resources from other modules created with create_resources()' 

    end
  end
end

