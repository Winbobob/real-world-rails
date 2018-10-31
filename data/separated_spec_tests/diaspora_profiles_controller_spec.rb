# frozen_string_literal: true

#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

describe ProfilesController, :type => :controller do
  before do
    sign_in eve, scope: :user
  end

  describe '#show' do
    let(:mock_person) { FactoryGirl.create(:user) }
    let(:mock_presenter) { double(:as_json => {:rock_star => "Jamie Cai"})}

    it "returns a post Presenter" 

  end

  describe '#edit' do
    it 'succeeds' 


    it 'sets the profile to the current users profile' 


    it 'sets the aspect to "person_edit" ' 


    it 'sets the person to the current users person' 

  end

  describe '#update' do
    it "sets the flash" 


    it "sets nsfw" 


    it "unsets nsfw" 


    it 'sets tags' 


    it 'sets plaintext tags' 


    it 'sets plaintext tags without #' 


    it 'sets valid birthday' 


    it 'displays error for invalid birthday' 


    context 'with a profile photo set' do
      before do
        @params = { :id => eve.person.id,
                    :profile =>
                     {:image_url => "",
                      :last_name  => eve.person.profile.last_name,
                      :first_name => eve.person.profile.first_name }}

        eve.person.profile.image_url = "http://tom.joindiaspora.com/images/user/tom.jpg"
        eve.person.profile.save
      end

      it "doesn't overwrite the profile photo when an empty string is passed in" 

    end

    context 'mass assignment' do
      before do
        new_person = FactoryGirl.create(:person)
        @profile_params = {:profile =>{ :person_id => new_person.id,
                                    :diaspora_handle => 'abc@a.com'}}
      end

      it 'person_id' 


      it 'diaspora handle' 

    end
  end
end

