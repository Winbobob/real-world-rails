# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Duplicator, type: :model do
  describe '#time_shift' do
    subject { Duplicator.new([], time_shift: 1.year).time_shift(original_date) }

    context 'when shifted date will be below the cap' do
      let(:original_date) { Time.zone.now }
      # Full time shifted date
      let(:expected_date) { original_date + 1.year }

      it { is_expected.to be_within(1.second).of expected_date }
    end

    context 'when shifted date will be above the cap' do
      let(:original_date) { DateTime.new(9999, 8, 1).in_time_zone('UTC') }
      # Capped date
      let(:expected_date) { DateTime.new(9999, 12, 31).in_time_zone('UTC') }

      it { is_expected.to be_within(1.second).of expected_date }
    end
  end

  context 'when Plain Old Ruby Objects' do
    class SimpleObject
      attr_reader :id

      def initialize(id)
        @id = id
      end

      def initialize_duplicate(_duplicator, _other)
      end

      def ==(other)
        self.class == other.class && state == other.state
      end

      protected

      def state
        [@id]
      end
    end

    # ComplexObject has children
    class ComplexObject
      attr_reader :id
      attr_reader :children

      def initialize(id, children)
        @id = id
        @children = children
      end

      def initialize_duplicate(duplicator, other)
        # Need compact to remove nils caused by excluded objects
        # Alternate method is below with the ActiveRecord object
        @children = duplicator.duplicate(other.children).tap(&:compact!)
      end

      def ==(other)
        self.class == other.class && state == other.state
      end

      def inspect
        children = @children.map(&:id).join(', ')
        "<#{self.class}: 0x#{object_id} @id=#{@id} @children=[#{children}]>"
      end

      protected

      def state
        [@id, @children.map(&:id)]
      end
    end

    def create_complex_objects
      #
      #       ---> c1 ---> s2
      #       |     |
      #       |     -----> s1
      #       |     |
      #  c3 -----> c2
      #       |
      #       ---> s3
      #
      @s1 = SimpleObject.new(1)
      @s2 = SimpleObject.new(2)
      @s3 = SimpleObject.new(3)

      # setup 2 objects with overlapping children
      @c1 = ComplexObject.new(11, [@s1, @s2])
      @c2 = ComplexObject.new(12, [@s1])

      # setup an even more complicated object
      @c3 = ComplexObject.new(13, [@c1, @c2, @s3])
    end

    def create_cyclic_graph
      #
      #       ------> c3 ------
      #       |       ^       v
      # c1-> c2       |      c5
      #       |       |       |
      #       ------> c4 <-----
      #               |
      #               ----> s1
      #
      @s1 = SimpleObject.new(1)
      @c4 = ComplexObject.new(14, []) # assign children later
      @c5 = ComplexObject.new(15, [@c4])
      @c3 = ComplexObject.new(13, [@c5])
      @c2 = ComplexObject.new(12, [@c3, @c4])
      @c1 = ComplexObject.new(11, [@c2])

      @c4.instance_variable_set(:@children, [@s1, @c3]) # create cycle
    end

    def create_second_cyclic_graph
      #
      #      ----> c22 <--
      #      |      |    |
      # c21 --      |    |
      #      |      |--> |
      #      ----------> c23
      #
      @c22 = ComplexObject.new(22, []) # assign children later
      @c23 = ComplexObject.new(23, [@c22])
      @c21 = ComplexObject.new(21, [@c22, @c23])

      @c22.instance_variable_set(:@children, [@c23])
    end

    context 'when SimpleObject is duplicated' do
      before(:each) do
        @obj_a = SimpleObject.new(2)
      end

      it 'is not duplicated if excluded' 


      it 'is duplicated by default' 


      it 'is duplicated once' 

    end

    context 'when ComplexObject is duplicated' do
      before(:each) do
        create_complex_objects
      end

      context 'without exclusions' do
        before(:each) do
          @duplicator = Duplicator.new
        end

        it 'duplicates object' 


        it 'duplicates objects referenced in 2 places once' 


        it 'duplicates objects with ComplexObject children' 

      end

      context 'with exclusions' do
        it 'duplicates ComplexObject but not excluded children' 


        it 'partially duplicates objects when some children are excluded' 

      end
    end

    context 'when Plain Old Ruby Object graphs are duplicated' do
      context 'with cycles' do
        before(:each) do
          create_cyclic_graph
        end

        it 'duplicates cyclic two object graph' 


        it 'duplicates cyclic graph' 


        it 'duplicates cyclic graph without excluded tail c6' 


        it 'duplicates cyclic graph without c5' 


        it 'duplicates cyclic graph without c4' 


        it 'duplicates sub-graph from c3' 

      end

      context 'when an array of objects is duplicated' do
        before(:each) do
          create_cyclic_graph
          create_second_cyclic_graph
          @duplicator = Duplicator.new
        end

        it 'duplicates objects mentioned twice without creating extras' 


        it 'duplicates disjoint graphs' 

      end

      context 'when joined graphs are duplicated' do
        before(:each) do
          create_cyclic_graph
          create_second_cyclic_graph
          # join graphs
          c1_children = @c1.children
          c1_children << @c21
          @c1.instance_variable_set(:@children, c1_children)

          @duplicator = Duplicator.new
        end

        it 'duplicates all objects' 


        it 'duplicates cyclically joined graphs' 

      end
    end
  end

  context 'when ActiveRecord objects' do
    class SimpleActiveRecord < ApplicationRecord
      def initialize_duplicate(_duplicator, _other)
      end
    end

    temporary_table(:simple_active_records) do |t|
      t.integer :data
    end

    class ComplexActiveRecord < ApplicationRecord
      has_and_belongs_to_many :children, class_name: 'ComplexActiveRecord',
                                         foreign_key: 'parent_id',
                                         join_table: :children_parents,
                                         association_foreign_key: 'children_id'
      has_and_belongs_to_many :parents, class_name: 'ComplexActiveRecord',
                                        foreign_key: 'children_id',
                                        join_table: :children_parents,
                                        association_foreign_key: 'parent_id'

      def initialize_duplicate(duplicator, other)
        # Need compact to remove nils caused by excluded objects
        self.children = duplicator.duplicate(other.children).compact
      end
    end

    temporary_table(:complex_active_records) do |t|
      t.integer :data
    end

    temporary_table(:children_parents) do |t|
      t.integer :children_id, foreign_key: { references: :complex_active_records, primary_key: :id }
      t.integer :parent_id, foreign_key: { references: :complex_active_records, primary_key: :id }
    end

    def create_ar_cyclic_graph
      #
      #       ------> c3 ------
      #       |       ^       v
      # c1-> c2       |      c5
      #       |       |       |
      #       ------> c4 <-----
      #               |
      #               ----> c6
      #
      @car1 = ComplexActiveRecord.create(data: 11)
      @car2 = @car1.children.create(data: 12)
      @car3 = @car2.children.create(data: 13)
      @car4 = @car2.children.create(data: 14)
      @car5 = @car3.children.create(data: 15)
      @car6 = @car4.children.create(data: 16)
      @car4.children << @car3
      @car5.children << @car4
    end

    def create_ar_graph
      #
      #    --> c22 ---> c23
      #    |
      # c21 --> c24 ---> c25
      #    |              ^
      #    --> c26 -------|
      #
      @car21 = ComplexActiveRecord.create(data: 21)
      @car22 = @car21.children.create(data: 22)
      @car23 = @car22.children.create(data: 23)
      @car24 = @car21.children.create(data: 24)
      @car25 = @car24.children.create(data: 25)
      @car26 = @car21.children.create(data: 26)
      @car26.children = @car24.children
    end

    with_temporary_table(:simple_active_records) do
      context 'when SimpleActiveRecord objects are duplicated' do
        before(:each) do
          @sar_1 = SimpleActiveRecord.create(data: 1)
        end

        it 'is duplicated by default' 


        it 'is not duplicated if excluded' 


        it 'is duplicated once' 

      end
    end

    with_temporary_table(:complex_active_records) do
      with_temporary_table(:children_parents) do
        # ComplexActiveRecord objects have associations to themselves
        context 'when ComplexActiveRecord objects are duplicated' do
          before(:each) do
            create_ar_graph
          end

          context 'without exclusions' do
            before(:each) do
              @duplicator = Duplicator.new
            end

            it 'duplicates a ComplexActiveRecord object' 


            it 'duplicates object referenced in 2 places once' 


            it 'duplicates ComplexActiveRecord object with children' 

          end

          context 'with exclusions' do
            it 'duplicates ComplexActiveRecord object but not excluded children' 


            it 'partially duplicates objects when some children are excluded' 

          end
        end

        context 'when ComplexActiveRecord object graphs are duplicated' do
          before(:each) do
            create_ar_cyclic_graph
          end

          context 'with cycles' do
            it 'duplicates cyclic two object graph' 


            it 'duplicates cyclic graph' 


            it 'duplicates cyclic graph without c4' 


            it 'duplicates sub-graph from c3' 


            it 'duplicates cyclic graph without c5' 


            it 'duplicates cyclic graph without excluded tail c6' 

          end

          context 'when an array of objects are duplicated' do
            before(:each) do
              create_ar_graph
              @duplicator = Duplicator.new
            end

            it 'duplicates disjoint graphs' 


            it 'duplicates objects mentioned twice without creating extras' 

          end

          context 'when joined graphs are duplicated' do
            before(:each) do
              create_ar_graph
              # join graphs
              @car1.children << @car21

              @duplicator = Duplicator.new
            end

            it 'duplicates all objects' 


            it 'duplicates cyclically joined graphs' 

          end
        end
      end
    end
  end
end

