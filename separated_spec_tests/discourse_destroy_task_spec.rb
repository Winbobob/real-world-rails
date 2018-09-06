require 'rails_helper'

describe DestroyTask do

  describe 'destroy topics' do
    let!(:c) { Fabricate(:category) }
    let!(:t) { Fabricate(:topic, category_id: c.id) }
    let!(:p) { Fabricate(:post, topic_id: t.id) }
    let!(:c2) { Fabricate(:category) }
    let!(:t2) { Fabricate(:topic, category_id: c2.id) }
    let!(:p2) { Fabricate(:post, topic_id: t2.id) }

    it 'destroys all topics in a category' 


    it "doesn't destroy system topics" 


    it 'destroys topics in all categories' 

  end

  describe 'private messages' do
    let!(:pm) { Fabricate(:private_message_post) }
    let!(:pm2) { Fabricate(:private_message_post) }

    it 'destroys all private messages' 

  end

  describe 'groups' do
    let!(:g) { Fabricate(:group) }
    let!(:g2) { Fabricate(:group) }

    it 'destroys all groups' 


    it "doesn't destroy default groups" 

  end

  describe 'users' do
    it 'destroys all non-admin users' 

  end

  describe 'stats' do
    it 'destroys all site stats' 

  end
end

