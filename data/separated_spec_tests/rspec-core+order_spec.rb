require 'support/aruba_support'

RSpec.describe 'command line', :ui do
  include_context "aruba support"

  before :all do
    write_file 'spec/simple_spec.rb', "
      RSpec.describe 'group 1' do
        specify('group 1 example 1') {}
        specify('group 1 example 2') {}
        specify('group 1 example 3') {}
        describe 'group 1-1' do
          specify('group 1-1 example 1') {}
          specify('group 1-1 example 2') {}
          specify('group 1-1 example 3') {}
        end
      end
    "

    write_file 'spec/simple_spec2.rb', "
      RSpec.describe 'group 2' do
        specify('group 2 example 1') {}
        specify('group 2 example 2') {}
        specify('group 2 example 3') {}
        describe 'group 2-1' do
          specify('group 2-1 example 1') {}
          specify('group 2-1 example 2') {}
          specify('group 2-1 example 3') {}
        end
      end
    "

    write_file 'spec/order_spec.rb', "
      RSpec.describe 'group 1' do
        specify('group 1 example 1')  {}
        specify('group 1 example 2')  {}
        specify('group 1 example 3')  {}
        specify('group 1 example 4')  {}
        specify('group 1 example 5')  {}
        specify('group 1 example 6')  {}
        specify('group 1 example 7')  {}
        specify('group 1 example 8')  {}
        specify('group 1 example 9')  {}
        specify('group 1 example 10') {}

        describe 'group 1-1' do
          specify('group 1-1 example 1')  {}
          specify('group 1-1 example 2')  {}
          specify('group 1-1 example 3')  {}
          specify('group 1-1 example 4')  {}
          specify('group 1-1 example 5')  {}
          specify('group 1-1 example 6')  {}
          specify('group 1-1 example 7')  {}
          specify('group 1-1 example 8')  {}
          specify('group 1-1 example 9')  {}
          specify('group 1-1 example 10') {}
        end

        describe('group 1-2')  { specify('example') {} }
        describe('group 1-3')  { specify('example') {} }
        describe('group 1-4')  { specify('example') {} }
        describe('group 1-5')  { specify('example') {} }
        describe('group 1-6')  { specify('example') {} }
        describe('group 1-7')  { specify('example') {} }
        describe('group 1-8')  { specify('example') {} }
        describe('group 1-9')  { specify('example') {} }
        describe('group 1-10') { specify('example') {} }
      end

      RSpec.describe('group 2')  { specify('example') {} }
      RSpec.describe('group 3')  { specify('example') {} }
      RSpec.describe('group 4')  { specify('example') {} }
      RSpec.describe('group 5')  { specify('example') {} }
      RSpec.describe('group 6')  { specify('example') {} }
      RSpec.describe('group 7')  { specify('example') {} }
      RSpec.describe('group 8')  { specify('example') {} }
      RSpec.describe('group 9')  { specify('example') {} }
      RSpec.describe('group 10') { specify('example') {} }
    "
  end

  describe '--order rand' do
    it 'runs the examples and groups in a different order each time' 

  end

  describe '--order rand:SEED' do
    it 'runs the examples and groups in the same order each time' 

  end

  describe '--seed SEED' do
    it "forces '--order rand' and runs the examples and groups in the same order each time" 


    it "runs examples in the same order, regardless of the order in which files are given" 

  end

  describe '--order defined on CLI with --order rand in .rspec' do
    after { remove_file '.rspec' }

    it "overrides --order rand with --order defined" 

  end

  context 'when a custom order is configured' do
    after { remove_file 'spec/custom_order_spec.rb' }

    before do
      write_file 'spec/custom_order_spec.rb', "
        RSpec.configure do |config|
          config.register_ordering :global do |list|
            list.sort_by { |item| item.description }
          end
        end

        RSpec.describe 'group B' do
          specify('group B example D')  {}
          specify('group B example B')  {}
          specify('group B example A')  {}
          specify('group B example C')  {}
        end

        RSpec.describe 'group A' do
          specify('group A example 1')  {}
        end
      "
    end

    it 'orders the groups and examples by the provided strategy' 

  end

  def examples(group)
    yield split_in_half(stdout.string.scan(/^\s+#{group} example.*$/))
  end

  def top_level_groups
    yield example_groups_at_level(0)
  end

  def nested_groups
    yield example_groups_at_level(2)
  end

  def example_groups_at_level(level)
    split_in_half(stdout.string.scan(/^\s{#{level*2}}group.*$/))
  end

  def split_in_half(array)
    length, midpoint = array.length, array.length / 2
    return array.slice(0, midpoint), array.slice(midpoint, length)
  end
end

