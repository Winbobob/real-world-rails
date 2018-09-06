require 'rails_helper'

describe BulkGrantPermissionSetPolicy do
  subject { described_class }

  permissions :new? do
    it 'allows superadmins to create new bulk grant permission sets' 


    it 'allows admins to create new bulk grant permission sets' 


    it 'is forbidden for super organisation admins' 


    it 'is forbidden for organisation admins' 


    it 'is forbidden for normal users' 

  end
end

