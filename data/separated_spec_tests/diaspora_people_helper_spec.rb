# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe PeopleHelper, :type => :helper do
  before do
    @user = alice
    @person = FactoryGirl.create(:person)
  end

  describe "#birthday_format" do
    it "contains the birth year if available" 


    it "does not contain the birth year if placeholder year is used" 

  end

  describe "#person_image_link" do
    it "returns an empty string if person is nil" 

    it "returns a link containing the person's photo" 

    it "returns a link to the person's profile" 

  end

  describe "#person_image_tag" do
    it "returns an empty string if person is nil" 

    it "should not allow basic XSS/HTML" 

  end

  describe '#person_link' do
    before do
      @person = FactoryGirl.create(:person)
    end

    it 'includes the name of the person if they have a first name' 


    it 'uses diaspora handle if the person has no first or last name' 


    it 'uses diaspora handle if first name and first name are rails#blank?' 


    it "should not allow basic XSS/HTML" 


    it 'links by id for a local user' 


    it "recognizes the 'display_name' option" 

  end

  describe '#local_or_remote_person_path' do
    before do
      @user = FactoryGirl.create(:user)
    end

    it "links by id if there is a period in the user's username" 


    it 'links by username for a local user' 


    it 'links by id for a remote person' 

  end
end

