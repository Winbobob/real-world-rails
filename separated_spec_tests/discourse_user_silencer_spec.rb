require 'rails_helper'

describe UserSilencer do

  before do
    SystemMessage.stubs(:create)
  end

  describe 'silence' do
    let(:user) { Fabricate(:user) }
    let(:silencer) { UserSilencer.new(user) }
    subject(:silence_user) { silencer.silence }

    it 'silences the user' 


    it 'hides posts' 


    context 'given a staff user argument' do
      it 'sends the correct message to the silenced user' 

    end

    context 'not given a staff user argument' do
      it 'sends a default message to the user' 

    end

    context 'given a message option' do
      it 'sends that message to the user' 

    end

    it "doesn't send a pm if save fails" 


    it "doesn't send a pm if the user is already silenced" 


    it "logs it with context" 

  end

  describe 'unsilence' do
    let(:user)             { stub_everything(save: true) }
    subject(:unsilence_user) { UserSilencer.unsilence(user, Fabricate.build(:admin)) }

    it 'unsilences the user' 


    it 'sends a message to the user' 


    it "doesn't send a pm if save fails" 


    it "logs it" 

  end

  describe 'hide_posts' do
    let(:user)    { Fabricate(:user, trust_level: 0) }
    let!(:post)   { Fabricate(:post, user: user) }
    subject       { UserSilencer.new(user) }

    it "hides all the user's posts" 


    it "hides the topic if the post was the first post" 


    it "doesn't hide posts if user is TL1" 


    it "only hides posts from the past 24 hours" 

  end

end

