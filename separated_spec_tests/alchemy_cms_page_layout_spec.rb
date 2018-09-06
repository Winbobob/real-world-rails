# frozen_string_literal: true

require 'spec_helper'

module Alchemy
  describe PageLayout do
    describe ".all" do
      # skip memoization
      before { PageLayout.instance_variable_set("@definitions", nil) }

      subject { PageLayout.all }

      it "should return all page_layouts" 


      it "should allow erb generated layouts" 


      context "with a YAML file including a symbol" do
        let(:yaml) { 'name: :symbol' }
        before do
          expect(File).to receive(:exist?).and_return(true)
          expect(File).to receive(:read).and_return(yaml)
        end

        it "returns the definition without error" 

      end

      context "with empty layouts file" do
        before { expect(YAML).to receive(:safe_load).and_return(false) }

        it "returns empty array" 

      end

      context "with missing layouts file" do
        before { expect(File).to receive(:exist?).and_return(false) }

        it "raises error empty array" 

      end
    end

    describe '.add' do
      it "adds a definition to all definitions" 


      it "adds a array of definitions to all definitions" 

    end

    describe ".get" do
      it "should return the page_layout definition found by given name" 

    end

    describe ".get_all_by_attributes" do
      subject { PageLayout.get_all_by_attributes(unique: true) }

      it "should return all page layout with the given attribute" 

    end

    describe '.layouts_with_own_for_select' do
      it "should not hold a layout twice" 

    end

    describe '.selectable_layouts' do
      let(:language) { Language.default }
      before { language }
      subject { PageLayout.selectable_layouts(language.id) }

      it "should not display hidden page layouts" 


      context "with already taken layouts" do
        before do
          allow(PageLayout).to receive(:all).and_return([{'unique' => true}])
          allow(Page).to receive(:where).and_return double(pluck: [1])
        end

        it "should not include unique layouts" 

      end

      context "with sites layouts present" do
        let(:site) { Site.new }

        let(:definitions) do
          [{'name' => 'default_site', 'page_layouts' => %w(index)}]
        end

        before do
          allow(Site).to receive(:definitions).and_return(definitions)
        end

        it "should only return layouts for site" 

      end
    end

    describe ".element_names_for" do
      it "should return all element names for the given pagelayout" 


      context "when given page_layout name does not exist" do
        it "should return an empty array" 

      end

      context "when page_layout definition does not contain the elements key" do
        it "should return an empty array" 

      end
    end

    describe '.human_layout_name' do
      let(:layout) { {'name' => 'contact'} }
      subject { PageLayout.human_layout_name(layout['name']) }

      context "with no translation present" do
        it "returns the name capitalized" 

      end

      context "with translation present" do
        before { expect(Alchemy).to receive(:t).and_return('Kontakt') }

        it "returns the translated name" 

      end
    end
  end
end

