require 'rails_helper'

describe ApiUserPolicy do
  subject { described_class }

  %i[new? create? index? edit? update? revoke?].each do |permission_name|
    permissions permission_name do
      it "is allowed only for superadmins" 

    end
  end
end

