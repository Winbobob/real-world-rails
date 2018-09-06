require 'rails_helper'
require 'user_name_suggester'

describe UserNameSuggester do

  describe 'name heuristics' do
    it 'is able to guess a decent username from an email' 

  end

  describe '.suggest' do
    before do
      User.stubs(:username_length).returns(3..15)
    end

    it "doesn't raise an error on nil username" 


    it 'corrects weird characters' 


    it "transliterates some characters" 


    it 'adds 1 to an existing username' 


    it "adds numbers if it's too short" 


    it "has a special case for me and i emails" 


    it "shortens very long suggestions" 


    it "makes room for the digit added if the username is too long" 


    it "doesn't suggest reserved usernames" 


    it "doesn't suggest generic usernames" 


    it "removes leading character if it is not alphanumeric" 


    it "allows leading _" 


    it "removes trailing characters if they are invalid" 


    it "allows dots in the middle" 


    it "remove leading dots" 


    it "remove trailing dots" 


    it 'handles usernames with a sequence of 2 or more special chars' 


    it 'should handle typical facebook usernames' 


    it 'removes underscore at the end of long usernames that get truncated' 


    it "adds number if it's too short after removing trailing underscore" 

  end

end

