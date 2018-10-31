require 'rails_helper'

describe ManifestPolicy do
  permissions :can_submit? do
    it 'allows user with submit role to submit own manifest' 


    it 'disallows user with submit role to submit manifest owned by someone in different org' 


    it 'allows user with submit role to submit manifest owned by someone in shared org' 


    it 'disallows user with submit role in different org from the org shared with manifest owner' 


    it 'disallows submitter with non-active submit role' 

  end

  permissions :can_view? do
    it 'allows state_data_download user to see all manifests in their state' 


    it 'allows epa_data_download user to see all manifests' 

  end

  permissions :can_create? do
    it 'dis-allows epa and state data download users' 


    it 'only signers may create' 

  end

  permissions :can_update? do
    it 'allows only owner' 

  end
end

