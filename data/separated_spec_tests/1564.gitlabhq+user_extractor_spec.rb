# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::UserExtractor do
  let(:text) do
    <<~TXT
    This is a long texth that mentions some users.
    @user-1, @user-2 and user@gitlab.org take a walk in the park.
    There they meet @user-4 that was out with other-user@gitlab.org.
    @user-1 thought it was late, so went home straight away
    TXT
  end
  subject(:extractor) { described_class.new(text) }

  describe '#users' do
    it 'returns an empty relation when nil was passed' 


    it 'returns the user case insensitive for usernames' 


    it 'returns users by primary email' 


    it 'returns users by secondary email' 

  end

  describe '#matches' do
    it 'includes all mentioned email adresses' 


    it 'includes all mentioned usernames' 

  end

  describe '#references' do
    it 'includes all user-references once' 

  end
end

