require 'spec_helper'

describe CropPolicy do
  subject { CropPolicy }

  let (:current_user) { FactoryGirl.create :user }
  let (:crop) { FactoryGirl.create :crop }
  let (:admin) { FactoryGirl.create :user, admin: true }

  permissions :create? do
    it 'denies anonymous users to create a crop' 

  end

  permissions :update? do
    it 'grants admin to update a crop' 

    it 'grants users to update a crop' 

    it 'denies anonymous users to update a crop' 

  end

  permissions :edit? do
    it 'grants users permission to view a crop edit page' 

    it 'denies anonymous users to view a crop edit page' 

  end
end

