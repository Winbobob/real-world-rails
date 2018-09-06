require "rails_helper"

describe "DiscoursePoll endpoints" do
  describe "fetch voters for a poll" do
    let(:user) { Fabricate(:user) }
    let(:post) { Fabricate(:post, raw: "[poll public=true]\n- A\n- B\n[/poll]") }

    it "should return the right response" 


    it 'should return the right response for a single option' 


    describe 'when post_id is blank' do
      it 'should raise the right error' 

    end

    describe 'when post_id is not valid' do
      it 'should raise the right error' 

    end

    describe 'when poll_name is blank' do
      it 'should raise the right error' 

    end

    describe 'when poll_name is not valid' do
      it 'should raise the right error' 

    end

    context "number poll" do
      let(:post) { Fabricate(:post, raw: "[poll type=number min=1 max=20 step=1 public=true]\n[/poll]") }

      it 'should return the right response' 

    end
  end
end

