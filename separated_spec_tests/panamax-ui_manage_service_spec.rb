require 'spec_helper'

describe 'managing a service' do
  context 'as a user' do
    it 'can navigate back to the application via the crumbs' 


    context 'when the service is running' do
      before do
        visit '/apps/2/services/1'
      end

      it 'has a title' 


      it 'can view a service for a running application' 


      it 'can delete a link' 


      it 'can delete a port' 


      it 'can delete a port' 


      it 'can delete an environment variable' 


      it 'can delete a volume' 


      it 'can edit the docker run command' 


      it 'displays the service status' 


    end

    context 'when the service has an env var with no value' do
      before do
        visit '/apps/2/services/6'
      end

      it 'allows the user to fill in the value' 

    end

    context 'when the service is not running' do
      before do
        visit '/apps/2/services/2'
      end

      it 'displays the service status' 

    end
  end
end

