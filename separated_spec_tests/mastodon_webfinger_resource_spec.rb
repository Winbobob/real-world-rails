require 'rails_helper'

describe WebfingerResource do
  around do |example|
    before_local = Rails.configuration.x.local_domain
    before_web = Rails.configuration.x.web_domain
    example.run
    Rails.configuration.x.local_domain = before_local
    Rails.configuration.x.web_domain = before_web
  end

  describe '#username' do
    describe 'with a URL value' do
      it 'raises with a route whose controller is not AccountsController' 


      it 'raises with a route whose action is not show' 


      it 'raises with a string that doesnt start with URL' 


      it 'finds the username in a valid https route' 


      it 'finds the username in a mixed case http route' 


      it 'finds the username in a valid http route' 

    end

    describe 'with a username and hostname value' do
      it 'raises on a non-local domain' 


      it 'finds username for a local domain' 


      it 'finds username for a web domain' 

    end

    describe 'with an acct value' do
      it 'raises on a non-local domain' 


      it 'raises on a nonsense domain' 


      it 'finds the username for a local account if the domain is the local one' 


      it 'finds the username for a local account if the domain is the Web one' 

    end
  end
end

