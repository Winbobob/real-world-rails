require "spec_helper"

module RSpec::Rails
  describe ViewRendering do
    let(:group) do
      RSpec::Core::ExampleGroup.describe do
        def controller
          ActionController::Base.new
        end
        include ViewRendering
      end
    end

    context "default" do
      context "ActionController::Base" do
        it "does not render views" 


        it "does not render views in a nested group" 

      end

      context "ActionController::Metal" do
        it "renders views" 

      end
    end

    describe "#render_views" do
      context "with no args" do
        it "tells examples to render views" 

      end

      context "with true" do
        it "tells examples to render views" 

      end

      context "with false" do
        it "tells examples not to render views" 


        it "overrides the global config if render_views is enabled there" 

      end

      it 'propogates to examples in nested groups properly' 


      context "in a nested group" do
        let(:nested_group) do
          group.describe{}
        end

        context "with no args" do
          it "tells examples to render views" 

        end

        context "with true" do
          it "tells examples to render views" 

        end

        context "with false" do
          it "tells examples not to render views" 

        end

        it "leaves the parent group as/is" 


        it "overrides the value inherited from the parent group" 


        it "passes override to children" 

      end
    end

    context 'when render_views? is false' do
      let(:controller) { ActionController::Base.new }

      before { controller.extend(ViewRendering::EmptyTemplates) }

      it 'supports manipulating view paths' 


      it 'supports manipulating view paths with arrays' 


      it 'supports manipulating view paths with resolvers' 


      def match_paths(*paths)
        eq paths.map { |path| File.expand_path path }
      end
    end
  end
end

