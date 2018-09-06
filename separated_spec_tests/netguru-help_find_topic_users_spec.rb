require 'spec_helper'
require_relative '../../app/services/skip_support'

class SomeUsers
  def self.all
  end

  def self.without(user)
    all
  end
end

describe FindTopicUsers do
  let(:users) { SomeUsers }
  let(:topic) { double(:topic, users: users) }
  let(:service) { FindTopicUsers.new(topic) }

  describe '#all' do
    it 'returns all topic users' 

  end

  describe '#all_without' do
    it 'calls users without method' 

  end
end

