require 'spec_helper'

describe FactoryBot::Factory do
  before do
    @name    = :user
    @class   = define_class('User')
    @factory = FactoryBot::Factory.new(@name)
    FactoryBot.register_factory(@factory)
  end

  it "has a factory name" 


  it "has a build class" 


  it "passes a custom creation block" 


  it "returns associations" 


  it "includes associations from the parent factory" 


  describe "when overriding generated attributes with a hash" do
    before do
      @name  = :name
      @value = 'The price is right!'
      @hash  = { @name => @value }
    end

    it "returns the overridden value in the generated attributes" 


    it "does not call a lazy attribute block for an overridden attribute" 


    it "overrides a symbol parameter with a string parameter" 

  end

  describe "overriding an attribute with an alias" do
    before do
      @factory.declare_attribute(FactoryBot::Declaration::Static.new(:test, 'original'))
      FactoryBot.aliases << [/(.*)_alias/, '\1']
      @result = @factory.run(FactoryBot::Strategy::AttributesFor,
                             test_alias: 'new')
    end

    it "uses the passed in value for the alias" 


    it "discards the predefined value for the attribute" 

  end

  it "guesses the build class from the factory name" 


  it "creates a new factory using the class of the parent" 


  it "creates a new factory while overriding the parent class" 

end

describe FactoryBot::Factory, "when defined with a custom class" do
  subject           { FactoryBot::Factory.new(:author, class: Float) }
  its(:build_class) { should eq Float }
end

describe FactoryBot::Factory, "when given a class that overrides #to_s" do
  let(:overriding_class) { Overriding::Class }

  before do
    define_class("Overriding")
    define_class("Overriding::Class") do
      def self.to_s
        "Overriding"
      end
    end
  end

  subject { FactoryBot::Factory.new(:overriding_class, class: Overriding::Class) }

  it "sets build_class correctly" 

end

describe FactoryBot::Factory, "when defined with a class instead of a name" do
  let(:factory_class) { ArgumentError }
  let(:name)          { :argument_error }

  subject { FactoryBot::Factory.new(factory_class) }

  its(:name)        { should eq name }
  its(:build_class) { should eq factory_class }
end

describe FactoryBot::Factory, "when defined with a custom class name" do
  subject           { FactoryBot::Factory.new(:author, class: :argument_error) }
  its(:build_class) { should eq ArgumentError }
end

describe FactoryBot::Factory, "with a name ending in s" do
  let(:name)           { :business }
  let(:business_class) { Business }

  before  { define_class('Business') }
  subject { FactoryBot::Factory.new(name) }

  its(:name)        { should eq name }
  its(:build_class) { should eq business_class }
end

describe FactoryBot::Factory, "with a string for a name" do
  let(:name) { :string }
  subject    { FactoryBot::Factory.new(name.to_s) }
  its(:name) { should eq name }
end

describe FactoryBot::Factory, "for namespaced class" do
  let(:name)           { :settings }
  let(:settings_class) { Admin::Settings }

  before do
    define_class("Admin")
    define_class("Admin::Settings")
  end

  context "with a namespaced class with Namespace::Class syntax" do
    subject { FactoryBot::Factory.new(name, class: "Admin::Settings") }

    it "sets build_class correctly" 

  end

  context "with a namespaced class with namespace/class syntax" do
    subject { FactoryBot::Factory.new(name, class: "admin/settings") }

    it "sets build_class correctly" 

  end
end

describe FactoryBot::Factory, "human names" do
  context "factory name without underscores" do
    subject           { FactoryBot::Factory.new(:user) }
    its(:names)       { should eq [:user] }
    its(:human_names) { should eq ["user"] }
  end

  context "factory name with underscores" do
    subject           { FactoryBot::Factory.new(:happy_user) }
    its(:names)       { should eq [:happy_user] }
    its(:human_names) { should eq ["happy user"] }
  end

  context "factory name with big letters" do
    subject           { FactoryBot::Factory.new(:LoL) }
    its(:names)       { should eq [:LoL] }
    its(:human_names) { should eq ["lol"] }
  end

  context "factory name with aliases" do
    subject           { FactoryBot::Factory.new(:happy_user, aliases: [:gleeful_user, :person]) }
    its(:names)       { should eq [:happy_user, :gleeful_user, :person] }
    its(:human_names) { should eq ["happy user", "gleeful user", "person"] }
  end
end

describe FactoryBot::Factory, "running a factory" do
  subject              { FactoryBot::Factory.new(:user) }
  let(:attribute)      { FactoryBot::Attribute::Static.new(:name, "value", false) }
  let(:declaration)    { FactoryBot::Declaration::Static.new(:name, "value", false) }
  let(:strategy) { double("strategy", result: "result", add_observer: true) }
  let(:attributes)     { [attribute] }
  let(:attribute_list) do
    double("attribute-list", declarations: [declaration], to_a: attributes)
  end

  before do
    define_model("User", name: :string)
    allow(FactoryBot::Declaration::Static).to receive(:new).
      and_return declaration
    allow(declaration).to receive(:to_attributes).and_return attributes
    allow(FactoryBot::Strategy::Build).to receive(:new).and_return strategy
    subject.declare_attribute(declaration)
  end

  it "creates the right strategy using the build class when running" 


  it "returns the result from the strategy when running" 


  it "calls the block and returns the result" 

end

