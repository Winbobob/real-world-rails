require 'spec_helper'

describe Fabrication::Schematic::Definition do

  let(:schematic) do
    Fabrication::Schematic::Definition.new('OpenStruct') do
      name "Orgasmo"
      something(:param => 2) { "hi!" }
      another_thing { 25 }
    end
  end

  describe "generator selection" do
    subject { Fabrication::Schematic::Definition.new(klass).generator }

    context "for an activerecord object", depends_on: :active_record do
      let(:klass) { 'ParentActiveRecordModel' }
      it { should == Fabrication::Generator::ActiveRecord }
    end

    context "for a mongoid object", depends_on: :mongoid do
      let(:klass) { 'ParentMongoidDocument' }
      it { should == Fabrication::Generator::Mongoid }
    end

    context "for a sequel object", depends_on: :sequel do
      let(:klass) { 'ParentSequelModel' }
      it { should == Fabrication::Generator::Sequel }
    end
  end

  describe ".new" do
    it "stores the name" 

    it "stores the generator" 

    it "stores the attributes" 

  end

  describe "#attribute" do
    it "returns the requested attribute if it exists" 

    it "returns nil if it does not exist" 

  end

  describe "#attributes" do
    it "loads the fabricator body" 

  end

  describe "#callbacks" do
    it "loads the fabricator body" 

  end

  describe "#fabricate" do
    context "an instance" do
      it "generates a new instance" 

    end
  end

  describe "#to_attributes" do
    let(:hash) { schematic.to_attributes }

    it "generates a hash with the object's attributes" 


    it "has the correct attributes" 

  end

  describe "#merge" do

    context "without inheritance" do

      subject { schematic.merge }

      it { should_not == schematic }

      it "stored 'name' correctly" 


      it "stored 'something' correctly" 


      it "stored 'another_thing' correctly" 


    end

    context "with inheritance" do

      subject do
        schematic.merge do
          name { "Willis" }
          something "Else!"
          another_thing(:thats_what => 'she_said') { "Boo-ya!" }
        end
      end

      it { should_not == schematic }

      it "stored 'name' correctly" 


      it "stored 'something' correctly" 


      it "stored 'another_thing' correctly" 


    end

  end

  describe "#on_init" do
    let(:init_block) { lambda {} }
    let(:init_schematic) do
      block = init_block
      Fabrication::Schematic::Definition.new('OpenStruct') do
        on_init(&block)
      end
    end

    it "stores the on_init callback" 


    context "with inheritance" do
      let(:child_block) { lambda {} }
      let(:child_schematic) do
        block = child_block
        init_schematic.merge do
          on_init(&block)
        end
      end

      it "overwrites the on_init callback" 

    end
  end

  describe "#initialize_with" do
    let(:init_block) { lambda {} }
    let(:init_schematic) do
      block = init_block
      Fabrication::Schematic::Definition.new('OpenStruct') do
        initialize_with(&block)
      end
    end

    it "stores the initialize_with callback" 


    context "with inheritance" do
      let(:child_block) { lambda {} }
      let(:child_schematic) do
        block = child_block
        init_schematic.merge do
          initialize_with(&block)
        end
      end

      it "overwrites the initialize_with callback" 

    end
  end

  describe '#transient' do
    let(:definition) do
      Fabrication::Schematic::Definition.new('OpenStruct') do
        transient :one, :two => 'with a default value', :three => 200
      end
    end

    it 'stores the attributes as transient' 


    it "accept default value" 

  end

  context "when overriding" do
    it "symbolizes attribute keys" 

  end

  describe '#sorted_attributes' do
    subject { definition.sorted_attributes.map(&:name) }
    let(:definition) do
      Fabrication::Schematic::Definition.new('OpenStruct') do
        three { nil }
        one ''
        transient :two
      end
    end
    it { should == [:one, :two, :three] }
  end

  describe '#klass' do
    subject { schematic.klass }
    it { should be OpenStruct }
  end
end

