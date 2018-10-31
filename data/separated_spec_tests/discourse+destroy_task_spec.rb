require 'rails_helper'

describe DestroyTask do

  describe 'destroy topics' do
    let!(:c) { Fabricate(:category) }
    let!(:t) { Fabricate(:topic, category: c) }
    let!(:p) { Fabricate(:post, topic: t) }
    let!(:c2) { Fabricate(:category) }
    let!(:t2) { Fabricate(:topic, category: c2) }
    let!(:p2) { Fabricate(:post, topic: t2) }
    let!(:sc) { Fabricate(:category, parent_category: c) }
    let!(:t3) { Fabricate(:topic, category: sc) }
    let!(:p3) { Fabricate(:post, topic: t3) }

    it 'destroys all topics in a category' 


    it 'destroys all topics in a sub category' 


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

