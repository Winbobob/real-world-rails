# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/importers/user_importer"

describe UserImporter do
  describe 'OAuth model association' do
    it 'creates new user based on OAuth data' 


    it 'associates existing model with OAuth data' 


    it 'updates the username if it has changed' 

  end

  describe '.new_from_username' do
    it 'creates a new user' 


    it 'replaces underlines with whitespace in username' 


    it 'creates an new user who has no account on the default wiki' 


    it 'returns an existing user' 


    it 'does not create a user if the username is not registered' 


    it 'works for users who have no Meta account if home wiki is provided' 


    it 'does not create a user if input is only whitespace' 


    it 'creates a user with the correct username capitalization' 


    it 'removes User: prefix from username' 


    it 'removes invisible left-to-right and right-to-left marks from start or end of username' 


    it 'updates the username of an existing user' 

  end

  describe '.update_users' do
    it 'updates global ids and MetaWiki registration date' 

  end
end

