TOP_LEVEL_VALUE_CONST = 7

class TestClass
  M = :m
  N = :n

  class Nested
    class NestedEvenMore
    end
  end
end

class TestClassThatDefinesSend
  C = :c

  def self.send
  end
end

class TestSubClass < TestClass
  P = :p
end

module RSpec
  module Mocks
    RSpec.describe "Constant Mutating" do
      include RSpec::Support::RecursiveConstMethods

      def reset_rspec_mocks
        ::RSpec::Mocks.space.reset_all
      end

      shared_context "constant example methods" do |const_name|
        define_method :const do
          recursive_const_get(const_name)
        end

        define_method :parent_const do
          recursive_const_get("Object::" + const_name.sub(/(::)?[^:]+\z/, ''))
        end

        define_method :last_const_part do
          const_name.split('::').last
        end
      end

      shared_examples "loaded constant stubbing" do |const_name|
        include_context "constant example methods", const_name

        let!(:original_const_value) { const }
        after { change_const_value_to(original_const_value) }

        def change_const_value_to(value)
          parent_const.__send__(:remove_const, last_const_part)
          parent_const.const_set(last_const_part, value)
        end

        it 'allows it to be stubbed' 


        it 'resets it to its original value when rspec clears its mocks' 


        it 'returns the stubbed value' 

      end

      shared_examples "loaded constant hiding" do |const_name|
        before do
          expect(recursive_const_defined?(const_name)).to be_truthy
        end

        it 'allows it to be hidden' 


        it 'resets the constant when rspec clear its mocks' 


        it 'returns nil' 

      end

      shared_examples "unloaded constant stubbing" do |const_name|
        include_context "constant example methods", const_name

        before do
          expect(recursive_const_defined?(const_name)).to be_falsey
        end

        it 'allows it to be stubbed' 


        it 'removes the constant when rspec clears its mocks' 


        it 'returns the stubbed value' 


        it 'ignores the :transfer_nested_constants option if passed' 

      end

      shared_examples "unloaded constant hiding" do |const_name|
        include_context "constant example methods", const_name

        before do
          expect(recursive_const_defined?(const_name)).to be_falsey
        end

        it 'allows it to be hidden, though the operation has no effect' 


        it 'remains undefined after rspec clears its mocks' 


        it 'returns nil' 

      end

      describe "#hide_const" do
        context "for a loaded constant nested in a module that redefines `send`" do
          it_behaves_like "loaded constant hiding", "TestClassThatDefinesSend::C"
        end

        context 'for a loaded nested constant' do
          it_behaves_like "loaded constant hiding", "TestClass::Nested"
        end

        context 'for a loaded constant prefixed with ::' do
          it_behaves_like 'loaded constant hiding', "::TestClass"
        end

        context 'for an unloaded constant with nested name that matches a top-level constant' do
          it_behaves_like "unloaded constant hiding", "TestClass::Hash"

          it 'does not hide the top-level constant' 


          it 'does not affect the ability to access the top-level constant from nested contexts', :silence_warnings, :if => RUBY_VERSION < '2.5' 

        end

        context 'for a loaded deeply nested constant' do
          it_behaves_like "loaded constant hiding", "TestClass::Nested::NestedEvenMore"
        end

        context 'for an unloaded unnested constant' do
          it_behaves_like "unloaded constant hiding", "X"
        end

        context 'for an unloaded nested constant' do
          it_behaves_like "unloaded constant hiding", "X::Y"
        end

        it 'can be hidden multiple times but still restores the original value properly' 


        it 'allows a constant to be hidden, then stubbed, restoring it to its original value properly' 

      end

      describe "#stub_const" do
        context "for a loaded constant nested in a module that redefines `send`" do
          it_behaves_like "loaded constant stubbing", "TestClassThatDefinesSend::C"
        end

        it "requires a string argument" 


        context 'for a loaded unnested constant' do
          it_behaves_like "loaded constant stubbing", "TestClass"

          it 'can be stubbed multiple times but still restores the original value properly' 


          it 'allows nested constants to be transferred to a stub module' 


          it 'removes the transferred constants on reset' 


          it 'does not transfer nested constants that are inherited from a superclass' 


          it 'raises an error when asked to transfer a nested inherited constant' 


          it 'allows nested constants to be selectively transferred to a stub module' 


          it 'raises an error if asked to transfer nested constants but given an object that does not support them' 


          it 'raises an error if asked to transfer nested constants on a constant that does not support nested constants' 


          it 'raises an error if asked to transfer a nested constant that is not defined' 


          describe 'with global transfer_nested_constant option set' do
            include_context "with isolated configuration"

            before do
              RSpec::Mocks.configuration.transfer_nested_constants = true
            end

            it 'allows nested constants to be transferred to a stub module' 


            context "when stubbing a constant that is not a module or a class" do
              it 'does not attempt to transfer constants' 


              it 'still raises an error when the `:transfer_nested_constants` option is provided' 

            end
          end
        end

        context 'for a loaded nested constant' do
          it_behaves_like "loaded constant stubbing", "TestClass::Nested"
        end

        context 'for a loaded constant prefixed with ::' do
          it_behaves_like 'loaded constant stubbing', "::TestClass"
        end

        context 'for an unloaded constant prefixed with ::' do
          it_behaves_like 'unloaded constant stubbing', "::SomeUndefinedConst"
        end

        context "for an unloaded constant nested in a module that redefines `send`" do
          it_behaves_like 'unloaded constant stubbing', "TestClassThatDefinesSend::SomeUndefinedConst"
        end

        context 'for an unloaded constant with nested name that matches a top-level constant' do
          it_behaves_like "unloaded constant stubbing", "TestClass::Hash"
        end

        context 'for a loaded deeply nested constant' do
          it_behaves_like "loaded constant stubbing", "TestClass::Nested::NestedEvenMore"
        end

        context 'for an unloaded unnested constant' do
          it_behaves_like "unloaded constant stubbing", "X"
        end

        context 'for an unloaded nested constant' do
          it_behaves_like "unloaded constant stubbing", "X::Y"

          it 'removes the root constant when rspec clears its mocks' 

        end

        context 'for an unloaded deeply nested constant' do
          it_behaves_like "unloaded constant stubbing", "X::Y::Z"

          it 'removes the root constant when rspec clears its mocks' 

        end

        context 'for an unloaded constant nested within a loaded constant' do
          it_behaves_like "unloaded constant stubbing", "TestClass::X"

          it 'removes the unloaded constant but leaves the loaded constant when rspec resets its mocks' 


          it 'raises a helpful error if it cannot be stubbed due to an intermediary constant that is not a module' 

        end

        context 'for an unloaded constant nested deeply within a deeply nested loaded constant' do
          it_behaves_like "unloaded constant stubbing", "TestClass::Nested::NestedEvenMore::X::Y::Z"

          it 'removes the first unloaded constant but leaves the loaded nested constant when rspec resets its mocks' 

        end
      end
    end

    RSpec.describe Constant do
      describe ".original" do
        context 'for a previously defined unstubbed constant' do
          let(:const) { Constant.original("TestClass::M") }

          it("exposes its name")                    { expect(const.name).to eq("TestClass::M") }
          it("indicates the name is valid")         { expect(const).to be_valid_name }
          it("indicates it was previously defined") { expect(const).to be_previously_defined }
          it("indicates it has not been mutated")   { expect(const).not_to be_mutated }
          it("indicates it has not been stubbed")   { expect(const).not_to be_stubbed }
          it("indicates it has not been hidden")    { expect(const).not_to be_hidden }
          it("exposes its original value")          { expect(const.original_value).to eq(:m) }
        end

        context 'for a previously defined stubbed constant' do
          before { stub_const("TestClass::M", :other) }
          let(:const) { Constant.original("TestClass::M") }

          it("exposes its name")                    { expect(const.name).to eq("TestClass::M") }
          it("indicates the name is valid")         { expect(const).to be_valid_name }
          it("indicates it was previously defined") { expect(const).to be_previously_defined }
          it("indicates it has been mutated")       { expect(const).to be_mutated }
          it("indicates it has been stubbed")       { expect(const).to be_stubbed }
          it("indicates it has not been hidden")    { expect(const).not_to be_hidden }
          it("exposes its original value")          { expect(const.original_value).to eq(:m) }
        end

        context 'for a previously undefined stubbed constant' do
          before { stub_const("TestClass::Undefined", :other) }
          let(:const) { Constant.original("TestClass::Undefined") }

          it("exposes its name")                        { expect(const.name).to eq("TestClass::Undefined") }
          it("indicates the name is valid")             { expect(const).to be_valid_name }
          it("indicates it was not previously defined") { expect(const).not_to be_previously_defined }
          it("indicates it has been mutated")           { expect(const).to be_mutated }
          it("indicates it has been stubbed")           { expect(const).to be_stubbed }
          it("indicates it has not been hidden")        { expect(const).not_to be_hidden }
          it("returns nil for the original value")      { expect(const.original_value).to be_nil }
        end

        context 'for a previously undefined parent of a stubbed constant' do
          before { stub_const("TestClass::UndefinedModule::Undefined", :other) }
          let(:const) { Constant.original("TestClass::UndefinedModule") }

          it("exposes its name")                        { expect(const.name).to eq("TestClass::UndefinedModule") }
          it("indicates the name is valid")             { expect(const).to be_valid_name }
          it("indicates it was not previously defined") { expect(const).not_to be_previously_defined }
          it("indicates it has been mutated")           { expect(const).to be_mutated }
          it("indicates it has been stubbed")           { expect(const).to be_stubbed }
          it("indicates it has not been hidden")        { expect(const).not_to be_hidden }
          it("returns nil for the original value")      { expect(const.original_value).to be_nil }
        end

        context 'for a previously undefined unstubbed constant' do
          let(:const) { Constant.original("TestClass::Undefined") }

          it("exposes its name")                        { expect(const.name).to eq("TestClass::Undefined") }
          it("indicates the name is valid")             { expect(const).to be_valid_name }
          it("indicates it was not previously defined") { expect(const).not_to be_previously_defined }
          it("indicates it has not been mutated")       { expect(const).not_to be_mutated }
          it("indicates it has not been stubbed")       { expect(const).not_to be_stubbed }
          it("indicates it has not been hidden")        { expect(const).not_to be_hidden }
          it("returns nil for the original value")      { expect(const.original_value).to be_nil }
        end

        context 'for a previously defined constant that has been stubbed twice' do
          before { stub_const("TestClass::M", 1) }
          before { stub_const("TestClass::M", 2) }
          let(:const) { Constant.original("TestClass::M") }

          it("exposes its name")                    { expect(const.name).to eq("TestClass::M") }
          it("indicates the name is valid")         { expect(const).to be_valid_name }
          it("indicates it was previously defined") { expect(const).to be_previously_defined }
          it("indicates it has been mutated")       { expect(const).to be_mutated }
          it("indicates it has been stubbed")       { expect(const).to be_stubbed }
          it("indicates it has not been hidden")    { expect(const).not_to be_hidden }
          it("exposes its original value")          { expect(const.original_value).to eq(:m) }
        end

        context 'for a previously undefined constant that has been stubbed twice' do
          before { stub_const("TestClass::Undefined", 1) }
          before { stub_const("TestClass::Undefined", 2) }
          let(:const) { Constant.original("TestClass::Undefined") }

          it("exposes its name")                        { expect(const.name).to eq("TestClass::Undefined") }
          it("indicates the name is valid")             { expect(const).to be_valid_name }
          it("indicates it was not previously defined") { expect(const).not_to be_previously_defined }
          it("indicates it has been mutated")           { expect(const).to be_mutated }
          it("indicates it has been stubbed")           { expect(const).to be_stubbed }
          it("indicates it has not been hidden")        { expect(const).not_to be_hidden }
          it("returns nil for the original value")      { expect(const.original_value).to be_nil }
        end

        context 'for a previously undefined hidden constant' do
          before { hide_const("SomeUndefinedConst") }
          let(:const) { Constant.original("SomeUndefinedConst") }

          it("exposes its name")                      { expect(const.name).to eq("SomeUndefinedConst") }
          it("indicates the name is valid")           { expect(const).to be_valid_name }
          it("indicates it was previously undefined") { expect(const).not_to be_previously_defined }
          it("indicates it has not been mutated")     { expect(const).not_to be_mutated }
          it("indicates it has not not been stubbed") { expect(const).not_to be_stubbed }
          it("indicates it has not been hidden")      { expect(const).not_to be_hidden }
          it("returns nil for the original value")    { expect(const.original_value).to be_nil }
        end

        context 'for a previously defined hidden constant' do
          before { hide_const("TestClass::M") }
          let(:const) { Constant.original("TestClass::M") }

          it("exposes its name")                    { expect(const.name).to eq("TestClass::M") }
          it("indicates the name is valid")         { expect(const).to be_valid_name }
          it("indicates it was previously defined") { expect(const).to be_previously_defined }
          it("indicates it has been mutated")       { expect(const).to be_mutated }
          it("indicates it has not been stubbed")   { expect(const).not_to be_stubbed }
          it("indicates it has been hidden")        { expect(const).to be_hidden }
          it("exposes its original value")          { expect(const.original_value).to eq(:m) }
        end

        context 'for a previously defined constant that has been hidden twice' do
          before { hide_const("TestClass::M") }
          before { hide_const("TestClass::M") }
          let(:const) { Constant.original("TestClass::M") }

          it("exposes its name")                    { expect(const.name).to eq("TestClass::M") }
          it("indicates the name is valid")         { expect(const).to be_valid_name }
          it("indicates it was previously defined") { expect(const).to be_previously_defined }
          it("indicates it has been mutated")       { expect(const).to be_mutated }
          it("indicates it has not been stubbed")   { expect(const).not_to be_stubbed }
          it("indicates it has been hidden")        { expect(const).to be_hidden }
          it("exposes its original value")          { expect(const.original_value).to eq(:m) }
        end

        context "for an invalid const name (such as an anonymous module's `inspect` output)" do
          let(:mod)   { Module.new }
          let(:const) { Constant.original(mod.inspect) }

          it("exposes the provided string as the name") { expect(const.name).to eq(mod.inspect) }
          it("indicates the name is invalid")           { expect(const).not_to be_valid_name }
          it("indicates it was not previously defined") { expect(const).not_to be_previously_defined }
          it("indicates it has not been mutated")       { expect(const).not_to be_mutated }
          it("indicates it has not been stubbed")       { expect(const).not_to be_stubbed }
          it("indicates it has not been hidden")        { expect(const).not_to be_hidden  }
          it("returns nil for its original value")      { expect(const.original_value).to be_nil }
        end
      end
    end
  end
end

