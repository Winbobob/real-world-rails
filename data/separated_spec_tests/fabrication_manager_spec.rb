require 'spec_helper'

describe Fabrication::Schematic::Manager do

  let(:manager) { Fabrication::Schematic::Manager.instance }
  before { manager.clear }

  describe "#register" do
    subject { manager }

    let(:options) { { aliases: ["thing_one", :thing_two] } }

    before do
      manager.register(:open_struct, options) do
        first_name "Joe"
        last_name { "Schmoe" }
      end
    end

    it "creates a schematic" 


    it "infers the correct class" 


    it "has the attributes" 


    context "with an alias" do
      it "recognizes the aliases" 

    end

  end

  describe '#[]' do
    subject { manager[key] }
    before { manager.schematics[:some] = 'thing' }

    context 'with a symbol' do
      let(:key) { :some }
      it { should == 'thing' }
    end

    context 'with a string' do
      let(:key) { 'some' }
      it { should == 'thing' }
    end
  end

  describe ".load_definitions" do
    before { Fabrication.clear_definitions }

    context 'with multiple path_prefixes and fabricator_paths' do
      it 'loads them all' 

    end

    context 'happy path' do
      it "loaded definitions" 

    end

    context 'when an error occurs during the load' do
      it 'still freezes the manager' 

    end
  end

end

