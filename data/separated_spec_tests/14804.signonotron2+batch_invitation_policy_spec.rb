require 'rails_helper'

describe BatchInvitationPolicy do
  subject { described_class }

  permissions :new? do
    it 'allows superadmins and admins to create new batch uploads' 


    it 'is forbidden for organisation admins to create new batch uploads even within their organisation subtree' 


    it 'is forbidden for super organisation admins to create new batch uploads even within their organisation subtree' 


    it 'is forbidden for normal users' 

  end

  permissions :assign_organisation_from_csv? do
    it 'is allowed for super admins' 


    it 'is allowed for admins' 


    it 'is forbidden for super organisation admins' 


    it 'is forbidden for organisation admins' 


    it 'is forbidden for normal users' 

  end
end

