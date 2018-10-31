require 'rails_helper'
require_dependency 'post_enqueuer'

describe PostEnqueuer do

  let(:user) { Fabricate(:user) }

  context 'with valid arguments' do
    let(:topic) { Fabricate(:topic) }
    let(:enqueuer) { PostEnqueuer.new(user, 'new_post') }

    it 'enqueues the post' 

  end

  context "topic validations" do
    let(:enqueuer) { PostEnqueuer.new(user, 'new_topic') }

    it "doesn't enqueue the post" 

  end

  context "post validations" do
    let(:enqueuer) { PostEnqueuer.new(user, 'new_post') }

    it "doesn't enqueue the post" 

  end

end

