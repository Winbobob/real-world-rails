require 'rails_helper'

RSpec.describe Admin::FlagsController do
  let(:admin) { Fabricate(:admin) }
  let(:post_1) { Fabricate(:post) }
  let(:user) { Fabricate(:user) }

  before do
    sign_in(admin)
  end

  context '#index' do
    it 'should return the right response when nothing is flagged' 


    it 'should return the right response' 

  end

  context '#agree' do
    it 'should raise a reasonable error if a flag was deferred and then someone else agreed' 


    it 'should be able to agree and keep content' 


    it 'should be able to hide spam' 

  end
end

