require 'spec_helper'

describe Fabrication::Generator::ActiveRecord, depends_on: :active_record do

  describe ".supports?" do
    subject { Fabrication::Generator::ActiveRecord }

    it "returns true for active record objects" 


    it "returns false for non-active record objects" 

  end

  describe "#persist" do
    let(:instance) { double }
    let(:generator) { Fabrication::Generator::ActiveRecord.new(ParentActiveRecordModel) }

    before { generator.send(:_instance=, instance) }

    it "saves" 

  end

  describe "#create" do

    let(:attributes) do
      Fabrication::Schematic::Definition.new(ParentActiveRecordModel) do
        string_field 'Different Content'
        number_field { |attrs| attrs[:string_field].length }
        child_active_record_models(count: 2) { |attrs, i| ChildActiveRecordModel.new(number_field: i) }
      end.attributes
    end

    let(:generator) { Fabrication::Generator::ActiveRecord.new(ParentActiveRecordModel) }
    let!(:parent_active_record_model) { generator.create(attributes, {}) }
    let(:child_active_record_models) { parent_active_record_model.child_active_record_models }

    it 'passes the object to blocks' 


    it 'passes the object and count to blocks' 


    it 'persists the company upon creation' 


    it 'generates the divisions' 


    it 'persists the divisions' 


  end

end

