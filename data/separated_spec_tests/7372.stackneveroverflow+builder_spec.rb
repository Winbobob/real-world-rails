require "spec_helper"

[NestedForm::Builder, NestedForm::SimpleBuilder, defined?(NestedForm::FormtasticBuilder) ? NestedForm::FormtasticBuilder : nil].compact.each do |builder|
  describe builder do
    let(:project) do
      Project.new
    end

    let(:template) do
      template = ActionView::Base.new
      template.output_buffer = ""
      template
    end

    context "with no options" do
      subject do
        builder.new(:item, project, template, {}, proc {})
      end

      describe '#link_to_add' do
        it "behaves similar to a Rails link_to" 


        it 'raises ArgumentError when missing association is provided' 


        it 'raises ArgumentError when accepts_nested_attributes_for is missing' 

      end

      describe '#link_to_remove' do
        it "behaves similar to a Rails link_to" 


        it 'has data-association attribute' 


        context 'when association is declared in a model by the class_name' do
          it 'properly detects association name' 

        end

        context 'when there is more than one nested level' do
          it 'properly detects association name' 

        end
      end

      describe '#fields_for' do
        it "wraps nested fields each in a div with class" 

      end

      it "wraps nested fields marked for destruction with an additional class" 


      it "puts blueprint into data-blueprint attribute" 


      it "adds parent association name to the blueprint div id" 


      it "doesn't render wrapper div" 


      it "doesn't render wrapper div when collection is passed" 


      it "doesn't render wrapper with nested_wrapper option" 

    end

    context "with options" do
      subject { builder.new(:item, project, template, {}, proc {}) }

      context "when model_object given" do
        it "should use it instead of new generated" 

      end
    end
  end
end

