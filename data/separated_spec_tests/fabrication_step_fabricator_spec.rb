require 'spec_helper'

describe Fabrication::Cucumber::StepFabricator do
  let(:name) { 'dogs' }

  describe '#klass' do
    context 'with a schematic for class "Boom"' do
      subject { Fabrication::Cucumber::StepFabricator.new(name).klass }
      let(:fabricator_name) { :dog }

      before do
        allow(Fabricate).to receive(:schematic).with(fabricator_name).and_return(double(klass: "Boom"))
      end

      it { should == "Boom" }

      context "given a human name" do
        let(:name) { "weiner dogs" }
        let(:fabricator_name) { :weiner_dog }
        it { should == "Boom" }
      end

      context "given a titlecase human name" do
        let(:name) { "Weiner Dog" }
        let(:fabricator_name) { :weiner_dog }
        it { should == "Boom" }
      end
    end
  end

  describe "#n" do
    let(:n) { 3 }
    let(:fabricator) { Fabrication::Cucumber::StepFabricator.new(name) }

    it "fabricates n times" 


    it "fabricates with attrs" 


    context 'with a plural subject' do
      let(:name) { 'dogs' }
      it 'remembers' 

    end

    context 'with a singular subject' do
      let(:name) { 'dog' }
      it 'remembers' 

    end

  end

  describe '#from_table' do
    it 'maps column names to attribute names' 


    context 'with table transforms' do
      let(:table) { double(hashes: [{ 'some' => 'thing' }]) }
      before { allow(Fabricate).to receive(:create) }

      it 'applies transforms' 

    end

    context 'with a plural subject' do
      let(:table) { double("ASTable", :hashes => hashes) }
      let(:hashes) do
        [{'some' => 'thing'},
         {'some' => 'panother'}]
      end
      it 'fabricates with each rows attributes' 

      it 'remembers' 

    end

    context 'singular' do
      let(:name) { 'dog' }
      let(:table) { double("ASTable", :rows_hash => rows_hash) }
      let(:rows_hash) do
        {'some' => 'thing'}
      end
      it 'fabricates with each row as an attribute' 

      it 'remembers' 

    end
  end

end

