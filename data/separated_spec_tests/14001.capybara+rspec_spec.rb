# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'capybara/rspec' do
  context 'Feature', type: :feature do
    it 'should include Capybara in rspec' 


    it 'should include RSpec matcher proxies' 


    context 'resetting session' do
      it 'sets a cookie in one example...' 


      it '...then it is not available in the next' 

    end

    context 'setting the current driver' do
      it 'sets the current driver in one example...' 


      it '...then it has returned to the default in the next example' 

    end

    it 'switches to the javascript driver when giving it as metadata', js: true do
      expect(Capybara.current_driver).to eq(Capybara.javascript_driver)
    end

    it 'switches to the given driver when giving it as metadata', driver: :culerity do
      expect(Capybara.current_driver).to eq(:culerity)
    end

    context '#all' do
      it 'allows access to the Capybara finder' 


      it 'allows access to the RSpec matcher' 

    end

    context '#within' do
      it 'allows access to the Capybara scoper' 


      it 'allows access to the RSpec matcher' 

    end
  end

  context 'Type: Other', type: :other do
    context 'when RSpec::Matchers is included after Capybara::DSL' do
      before do
        class DSLMatchersTest
          include Capybara::DSL
          include RSpec::Matchers
        end

        @test_class_instance = DSLMatchersTest.new
      end

      context '#all' do
        it 'allows access to the Capybara finder' 


        it 'allows access to the RSpec matcher' 

      end

      context '#within' do
        it 'allows access to the Capybara scoper' 


        it 'allows access to the RSpec matcher' 

      end

      context 'when `match_when_negated` is not defined in a matcher' do
        before do
          RSpec::Matchers.define :only_match_matcher do |expected|
            match do |actual|
              !(actual ^ expected)
            end
          end
        end

        it 'can be called with `not_to`' 

      end
    end

    it 'should not include Capybara' 

  end
end

feature 'Feature DSL' do
  scenario 'is pulled in' do
    visit('/foo')
    expect(page.body).to include('Another World')
  end
end

