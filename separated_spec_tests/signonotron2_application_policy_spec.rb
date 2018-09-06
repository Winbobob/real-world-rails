require 'rails_helper'

describe ApplicationPolicy do
  subject { described_class }

  [:index?, :edit?, :update?, :manage_supported_permissions?, :users_with_access?].each do |permission_name|
    permissions permission_name do
      it "is allowed only for superadmins" 

    end
  end
end

