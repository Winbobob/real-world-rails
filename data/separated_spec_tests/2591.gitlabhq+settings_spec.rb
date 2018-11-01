require 'spec_helper'
require_relative '../../config/initializers/1_settings' unless defined?(Settings)

describe Settings do
  describe '#ldap' do
    it 'can be accessed with dot syntax all the way down' 


    # Specifically trying to cause this error discovered in EE when removing the
    # reassignment of each server element with Settingslogic.
    #
    #   `undefined method `label' for #<Hash:0x007fbd18b59c08>`
    #
    it 'can be accessed in a very specific way that breaks without reassigning each element with Settingslogic' 

  end

  describe '#host_without_www' do
    context 'URL with protocol' do
      it 'returns the host' 

    end

    context 'URL without protocol' do
      it 'returns the host' 


      context 'URL with user/port' do
        it 'returns the host' 

      end
    end
  end
end

