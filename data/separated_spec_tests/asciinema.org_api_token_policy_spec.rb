require 'rails_helper'

describe ApiTokenPolicy do

  subject { described_class }

  permissions :destroy? do
    it "denies access if user is nil" 


    it "grants access if user is admin" 


    it "grants access if user is the owner of the token" 


    it "denies access if user isn't the owner of the token" 

  end

end

