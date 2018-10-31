require "spec_helper"

describe FactoryBot::EvaluatorClassDefiner do
  it "returns an evaluator when accessing the evaluator class" 


  it "adds each attribute to the evaluator" 


  it "evaluates the block in the context of the evaluator" 


  it "only instance_execs the block once even when returning nil" 


  it "sets attributes on the evaluator class" 


  context "with a custom evaluator as a parent class" do
    it "bases its attribute lists on itself and its parent evaluator" 

  end

  def define_evaluator(arguments = {})
    evaluator_class = define_evaluator_class(arguments)
    evaluator_class.new(FactoryBot::Strategy::Null)
  end

  def define_evaluator_class(arguments = {})
    evaluator_class_definer = FactoryBot::EvaluatorClassDefiner.new(
      arguments[:attributes] || [],
      arguments[:parent_class] || FactoryBot::Evaluator
    )
    evaluator_class_definer.evaluator_class
  end

  def stub_attribute(name = :attribute, &value)
    value ||= -> {}
    double(name.to_s, name: name.to_sym, to_proc: value)
  end
end

