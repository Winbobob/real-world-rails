# frozen_string_literal: true

require 'spec_helper'

class Party < ActiveRecord::Base
  belongs_to :location
end

module Namespace1
  module Namespace2
    class Party
    end
  end
end

module Namespace
  class Party
  end
end

module PartyEngine
  module Namespace
    class Party
    end
  end
end

module Alchemy
  describe Resource do
    # Alchemy's standard module definition. Only engine_name is relevant here
    let(:module_definition) do
      {
        "name" => "party_list",
        "engine_name" => "party_engine",
        "navigation" => {
          "name" => "modules.party_list",
          "controller" => "/admin/parties",
          "action" => "index",
          "image" => "/assets/party_list_module.png"
        }
      }
    end

    let(:columns) do
      [
        double(:column, {name: 'name', type: :string, array: false}),
        double(:column, {name: 'hidden_value', type: :string, array: false}),
        double(:column, {name: 'description', type: :text, array: false}),
        double(:column, {name: 'id', type: :integer, array: false}),
        double(:column, {name: 'starts_at', type: :datetime, array: false}),
        double(:column, {name: 'location_id', type: :integer, array: false}),
        double(:column, {name: 'organizer_id', type: :integer, array: false})
      ]
    end

    let(:resource) { Resource.new("admin/parties", module_definition) }

    before :each do
      # stubbing an ActiveRecord::ModelSchema...
      allow(Party).to receive(:columns).and_return columns
    end

    describe "#initialize" do
      it "sets an instance variable that holds the controller path" 


      context "when initialized with a module definition" do
        it "sets an instance variable that holds the module definition" 

      end

      context "when initialized with a custom model" do
        it "sets @model to custom model" 

      end

      context "when initialized without custom model" do
        it "guesses the model by the controller_path" 

      end

      context "when model has alchemy_resource_relations defined" do
        before do
          allow(Party).to receive(:alchemy_resource_relations) do
            {location: {attr_method: 'name', type: 'string'}}
          end
        end

        context ", but not an ActiveRecord association" do
          before do
            allow(Party).to receive(:respond_to?) do |arg|
              case arg
              when :reflect_on_all_associations
                then false
              when :alchemy_resource_relations
                then true
              end
            end
          end

          it "should raise error." 

        end
      end
    end

    describe "#resource_array" do
      it "splits the controller_path and returns it as array." 


      it "deletes 'admin' if found hence our model isn't in the admin-namespace by convention" 

    end

    describe "#model" do
      it "returns the @model instance variable" 

    end

    describe "#resources_name" do
      it "returns plural name (like parties for model Party)" 

    end

    describe "#resource_name" do
      it "returns the resources name as singular" 

    end

    describe "#namespaced_resource_name" do
      it "returns resource_name with namespace (namespace_party for Namespace::Party), i.e. for use in forms" 


      it "equals resource_name if resource not namespaced" 


      it "doesn't include the engine's name" 

    end

    describe "#engine_name" do
      it "should return the engine name of the module" 

    end

    describe "#namespace_for_scope" do
      it "returns a scope for use in url_for based path helpers" 

    end

    describe "#attributes" do
      subject { resource.attributes }

      it "parses and returns the resource model's attributes from ActiveRecord::ModelSchema" 


      it "skips the standard database attributes (rails defaults)" 


      it "skips attributes returned by skipped_alchemy_resource_attributes" 


      context "when resource_relations are not defined" do
        it "includes the attribute" 

      end

      context "with restricted attributes set" do
        before do
          allow(Party).to receive(:restricted_alchemy_resource_attributes) do
            [{name: "name", type: :string}]
          end
        end

        it "should include the restricted attributes" 

      end
    end

    context "when `skipped_alchemy_resource_attributes` is defined as class method in the model" do
      let(:custom_skipped_attributes) { %w(hidden_name) }

      before do
        allow(Party).to receive(:skipped_alchemy_resource_attributes) do
          custom_skipped_attributes
        end
      end

      describe '#attributes' do
        it "does not return the attributes returned by that method" 

      end
    end

    describe "#searchable_attribute_names" do
      subject { resource.searchable_attribute_names }

      it "returns all attribute names of type string and text" 


      context "when model provides custom defined searchable attribute names" do
        before do
          allow(Party).to receive(:searchable_alchemy_resource_attributes) do
            %w(date venue age)
          end
        end

        it "returns the custom defined attribute names from the model" 

      end

      context "when model has a relation defined" do
        before do
          allow(Party).to receive(:alchemy_resource_relations) do
            {
              location: {attr_method: "name", attr_type: :string}
            }
          end
        end

        it "also includes the searchable attributes of the relation" 

      end

      context "with an array attribute" do
        let(:columns) do
          [
            double(:column, {name: 'name', type: :string, array: false}),
            double(:column, {name: 'languages', type: :string, array: true})
          ]
        end

        it "does not include this column" 

      end
    end

    describe "#search_field_name" do
      subject { resource.search_field_name }

      it "returns a ransack compatible search query" 

    end

    describe "#editable_attributes" do
      subject { resource.editable_attributes }

      let(:columns) do
        [
          double(:column, {name: 'name', type: :string}),
          double(:column, {name: 'title', type: :string}),
          double(:column, {name: 'synced_at', type: :datetime}),
          double(:column, {name: 'remote_record_id', type: :string})
        ]
      end

      before do
        allow(Party).to receive(:restricted_alchemy_resource_attributes) do
          [:synced_at, :remote_record_id]
        end
      end

      it "does not contain restricted attributes" 

    end

    context "when alchemy_resource_relations defined as class method in the model" do
      let(:resource) { Resource.new("admin/events") }

      before do
        allow(Event).to receive(:alchemy_resource_relations) do
          {
            location: {attr_method: "name", attr_type: :string}
          }
        end
      end

      describe '#resource_relations' do
        it "should contain model_association from ActiveRecord::Reflections" 


        it "adds '_id' to relation key" 


        it "stores the relation name" 

      end

      describe '#model_associations' do
        it "skip default alchemy model associations" 

      end

      describe '#model_association_names' do
        it 'returns an array of association names' 

      end

      describe '#attributes' do
        it "contains the attribute of the related model" 


        it "contains the related model's column type as type" 

      end
    end

    describe "#engine_name" do
      it "should return the engine name of the module" 

    end

    describe "#in_engine?" do
      it "should return true if the module is shipped within an engine" 

    end
  end
end

