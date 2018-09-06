# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Course::Conditional::UserSatisfiabilityGraph do
  class DummyConditionalCondition < ApplicationRecord
    acts_as_conditional
    acts_as_condition
    attr_accessor :conditions
    attr_accessor :satisfied
    attr_accessor :id

    def specific_conditions
      @conditions
    end

    def dependent_object
      self
    end

    def satisfied_by?(_course_user)
      @satisfied
    end

    def permitted_for!(_course_user)
      @satisfied = true
    end

    def precluded_for!(_course_user)
      @satisfied = false
    end

    def satisfiable?
      true
    end

    def inspect
      "<#{@id}>"
    end

    def self.columns
      []
    end

    def self.load_schema!; end

    def self.build(conditions, id)
      dummy = new
      dummy.conditions = conditions
      dummy.satisfied = false
      dummy.id = id
      dummy
    end
  end

  def create_simple_graph
    #
    # A ---------
    #    |   |   |
    #    v   v   |
    #    C-->D   |
    #        |   |
    #        ->E<-
    # B -------^
    #
    a = DummyConditionalCondition.build([], 'A')
    b = DummyConditionalCondition.build([], 'B')
    c = DummyConditionalCondition.build([a], 'C')
    d = DummyConditionalCondition.build([a, c], 'D')
    e = DummyConditionalCondition.build([a, b, d], 'E')

    { A: a, B: b, C: c, D: d, E: e }
  end

  def create_cyclic_graph
    #
    # A ----> B ----> C
    # ^               |
    # |               |
    #  ----------------
    #
    a = DummyConditionalCondition.build([], 'A')
    b = DummyConditionalCondition.build([a], 'B')
    c = DummyConditionalCondition.build([b], 'C')
    a.conditions.append(c)

    { A: a, B: b, C: c }
  end

  def create_disconnected_graph
    #
    # A ----> B ----> C
    #
    # D ----> E ----> F
    #
    # G ----> H ----> I
    #
    a = DummyConditionalCondition.build([], 'A')
    b = DummyConditionalCondition.build([a], 'B')
    c = DummyConditionalCondition.build([b], 'C')

    d = DummyConditionalCondition.build([], 'D')
    e = DummyConditionalCondition.build([d], 'E')
    f = DummyConditionalCondition.build([e], 'F')

    g = DummyConditionalCondition.build([], 'G')
    h = DummyConditionalCondition.build([g], 'H')
    i = DummyConditionalCondition.build([h], 'I')

    { A: a, B: b, C: c, D: d, E: e, F: f, G: g, H: h, I: i }
  end

  describe '.build' do
    subject { Course::Conditional::UserSatisfiabilityGraph }

    context 'when dependencies do not contain cycle' do
      let(:simple_graph) { create_simple_graph }

      it 'builds satisfiability graph' 

    end

    context 'when the dependencies contains cycle' do
      let(:cyclic_graph) { create_cyclic_graph }

      it 'raise ArgumentError' 

    end
  end

  describe '.reachable?' do
    let(:simple_graph) { create_simple_graph }
    let(:condition_z)  { DummyConditionalCondition.build([], 'Z') }

    subject { Course::Conditional::UserSatisfiabilityGraph }

    context 'when a path exist between the given conditionals' do
      context 'when all conditions have dependent object' do
        it 'returns true' 

      end

      context 'when one of the conditions in the path do not have any dependent object' do
        it 'returns true' 

      end
    end

    context 'when no path exist between the given conditionals' do
      context 'when all conditions have dependent object' do
        it 'returns false' 

      end

      context 'when one of the conditions evaluated do not have any dependent object' do
        it 'returns false' 

      end
    end
  end

  describe '#evaluate' do
    def check_evaluated_result(graph, satisfied)
      graph.values.index { |v| v.satisfied != satisfied.include?(v) }.nil?
    end

    context 'simple graph' do
      let(:graph) do
        graph = create_simple_graph
        graph.each { |_, v| allow(v).to receive(:satisfied_by?).and_return(false) }
        graph
      end

      subject { Course::Conditional::UserSatisfiabilityGraph.new(graph.values) }

      context 'when satisfied conditional do not satisfied additional conditions' do
        it 'permits only conditionals with no condition' 

      end

      context 'when satisfying A satisfied additional conditions' do
        it 'permits only conditionals that have been satisfied' 

      end

      context 'when satisfied conditional satisfied additional conditions' do
        it 'permits all conditionals' 

      end

      context 'when satisfied conditionals become unsatisfied' do
        it 'precludes the newly unsatisfied conditionals' 

      end
    end

    context 'disconnected graph' do
      let(:graph) do
        graph = create_disconnected_graph
        graph.each { |_, v| allow(v).to receive(:satisfied_by?).and_return(false) }
        graph
      end

      subject { Course::Conditional::UserSatisfiabilityGraph.new(graph.values) }

      context 'when satisfied conditional do not satisfied additional conditions' do
        it 'permits only conditionals with no condition' 

      end

      context 'when satisfying A & D satisfied additional conditions' do
        it 'permits only conditionals that have been satisfied' 

      end

      context 'when satisfying A & D & G satisfied additional conditions' do
        it 'permits each disconnected components up to level 2' 

      end

      context 'when all cascading conditions are satisfied by user in component A & D' do
        it 'permits all conditional in component A & D and conditional H' 

      end
    end
  end
end

