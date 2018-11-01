require 'rails_helper'

describe ContentSecurityPolicy do
  describe 'report-uri' do
    it 'is enabled by SiteSetting' 

  end

  describe 'script-src defaults' do
    it 'always have self and unsafe-eval' 


    it 'enforces https when SiteSetting.force_https' 


    it 'whitelists Google Analytics and Tag Manager when integrated' 


    it 'whitelists CDN when integrated' 


    it 'can be extended with more sources' 

  end

  def parse(csp_string)
    csp_string.split(';').map do |policy|
      directive, *sources = policy.split
      [directive, sources]
    end.to_h
  end
end

