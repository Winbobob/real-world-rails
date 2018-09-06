require 'spec_helper'

describe Fabrication::Generator::Base do

  describe ".supports?" do
    subject { Fabrication::Generator::Base }
    it "supports any object" 

  end

  describe "#build" do

    let(:generator) { Fabrication::Generator::Base.new(ParentRubyObject) }

    let(:attributes) do
      Fabrication::Schematic::Definition.new('ParentRubyObject') do
        string_field 'different content'
        extra_fields(count: 4) { |attrs, index| "field #{index}" }
      end.attributes
    end

    let(:parent_ruby_object) { generator.build(attributes) }

    it 'generates an instance' 


    it 'passes the object and count to blocks' 


    it 'sets the static value' 


    context "with on_init block" do
      subject { schematic.fabricate }

      context "using init_with" do
        let(:schematic) do
          Fabrication::Schematic::Definition.new('ClassWithInit') do
            on_init { init_with(:a, :b) }
          end
        end

        it "sends the return value of the block to the klass' initialize method" 

      end

      context "not using init_with" do
        let(:schematic) do
          Fabrication::Schematic::Definition.new('ClassWithInit') do
            on_init { [ :a, :b ] }
          end
        end

        it "sends the return value of the block to the klass' initialize method" 


      end
    end

    context "with initialize_with block" do
      subject { schematic.fabricate }

      context "using only raw values" do
        let(:schematic) do
          Fabrication::Schematic::Definition.new('ClassWithInit') do
            initialize_with { Struct.new(:arg1, :arg2).new(:fixed_value) }
          end
        end

        it "saves the return value of the block as instance" 

      end

      context "using attributes inside block" do
        let(:schematic) do
           Fabrication::Schematic::Definition.new('ClassWithInit') do
             arg1 10
             initialize_with { Struct.new(:arg1, :arg2).new(arg1, arg1 + 10) }
          end
        end

        context "without override" do
          it "saves the return value of the block as instance" 

        end

        context "with override" do
          subject { schematic.fabricate(arg1: 30) }
          it "saves the return value of the block as instance" 

        end

      end
    end

    context "using an after_create hook" do
      let(:schematic) do
        Fabrication::Schematic::Definition.new('ParentRubyObject') do
          string_field 'something'
          after_create { |k| k.string_field.upcase! }
        end
      end

      it "calls after_create when generated with saving" 


      it "does not call after_create when generated without saving" 

    end

    context 'all the callbacks' do
      subject { schematic.build }
      let(:schematic) do
        Fabrication::Schematic::Definition.new('ParentRubyObject') do
          string_field ""
          after_build { |k| k.string_field += '1' }
          before_validation { |k| k.string_field += '2' }
          after_validation { |k| k.string_field += '3' }
        end
      end
      its(:string_field) { should == '1' }
    end

    context 'with custom generators' do
      before do
        Fabrication.configure do |config|
          config.generators << ImmutableGenerator
        end
      end

      after do
        Fabrication::Config.reset_defaults
      end

      it "uses custom generator" 

    end
  end

  describe '#create' do
    context 'all the callbacks' do
      subject { schematic.fabricate }
      let(:schematic) do
        Fabrication::Schematic::Definition.new('ParentRubyObject') do
          string_field ""
          after_build { |k| k.string_field += '1' }
          before_validation { |k| k.string_field += '2' }
          after_validation { |k| k.string_field += '3' }
          before_save { |k| k.string_field += '4' }
          before_create { |k| k.string_field += '5' }
          after_create { |k| k.string_field += '6' }
          after_save { |k| k.string_field += '7' }
        end
      end
      its(:string_field) { should == '1234567' }
    end
  end

  describe "#persist" do
    let(:instance) { double }
    let(:generator) { Fabrication::Generator::Base.new(Object) }

    before { generator.send(:_instance=, instance) }

    it 'saves' 

  end

  describe 'robustness tests' do
    it 'maintains valid state on exceptions while building' 

  end

end

