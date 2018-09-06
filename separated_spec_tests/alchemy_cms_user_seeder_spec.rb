# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'User seeding' do
  context 'when db/seeds/alchemy/users.yml file is present' do
    let(:seeds_file) do
      'spec/fixtures/users.yml'
    end

    before do
      FileUtils.mkdir_p(Rails.root.join('db/seeds/alchemy'))
      FileUtils.cp(seeds_file, Rails.root.join('db/seeds/alchemy/users.yml'))
    end

    it 'seeds users' 


    after do
      FileUtils.rm_rf(Rails.root.join('db/seeds'))
    end
  end
end

