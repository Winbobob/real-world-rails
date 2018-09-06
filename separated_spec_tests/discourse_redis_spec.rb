require 'rails_helper'

RSpec.describe "Redis rake tasks" do
  let(:redis) { $redis.without_namespace }

  before do
    @multisite = Rails.configuration.multisite
    Rails.configuration.multisite = true
    Discourse::Application.load_tasks
  end

  after do
    Rails.configuration.multisite = @multisite
  end

  describe 'clean up' do
    it 'should clean up orphan Redis keys' 

  end
end

