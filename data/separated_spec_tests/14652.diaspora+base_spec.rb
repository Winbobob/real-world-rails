# frozen_string_literal: true

require Rails.root.join('spec', 'shared_behaviors', 'stream')

describe Stream::Base do
  before do
    @stream = Stream::Base.new(alice)
  end

  describe '#stream_posts' do
    it "should returns the posts.for_a_stream" 


    context "when alice has liked some posts" do
      before do
        bob.post(:status_message, :text => "sup", :to => bob.aspects.first.id)
        @liked_status = bob.posts.last
        @like = FactoryGirl.create(:like, :target => @liked_status, :author => alice.person)
      end

      it "marks the posts as liked" 

    end
  end

  describe '.can_comment?' do
    before do
      @person = FactoryGirl.create(:person)
      allow(@stream).to receive(:people).and_return([bob.person, eve.person, @person])
    end

    it 'allows me to comment on my local contacts post' 


    it 'allows me to comment on my own post' 


    it 'allows me to comment on any local public post' 


    it 'allows me to comment on a remote contacts post' 


    it 'returns false if person is remote and not a contact' 

  end

  describe '#people' do
    it 'excludes blocked people' 

  end

  describe 'shared behaviors' do
    it_should_behave_like 'it is a stream'
  end
end

