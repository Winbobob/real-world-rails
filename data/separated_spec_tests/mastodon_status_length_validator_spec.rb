# frozen_string_literal: true

require 'rails_helper'

describe StatusLengthValidator do
  describe '#validate' do
    it 'does not add errors onto remote statuses'
    it 'does not add errors onto local reblogs'

    it 'adds an error when content warning is over 500 characters' 


    it 'adds an error when text is over 500 characters' 


    it 'adds an error when text and content warning are over 500 characters total' 


    it 'counts URLs as 23 characters flat' 


    it 'counts only the front part of remote usernames' 

  end
end

