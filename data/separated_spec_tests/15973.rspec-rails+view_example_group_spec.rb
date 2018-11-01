require "spec_helper"

module RSpec::Rails
  describe ViewExampleGroup do
    it_behaves_like "an rspec-rails example group mixin", :view,
      './spec/views/', '.\\spec\\views\\'

    describe 'automatic inclusion of helpers' do
      module ::ThingsHelper; end
      module ::Namespaced; module ThingsHelper; end; end

      it 'includes the helper with the same name' 


      it 'includes the namespaced helper with the same name' 


      it 'operates normally when no helper with the same name exists' 


      it 'operates normally when the view has no path and there is a Helper class defined' 


      context 'application helper exists' do
        before do
          if !Object.const_defined? 'ApplicationHelper'
            module ::ApplicationHelper; end
            @application_helper_defined = true
          end
        end

        after do
          if @application_helper_defined
            Object.__send__ :remove_const, 'ApplicationHelper'
          end
        end

        it 'includes the application helper' 

      end

      context 'no application helper exists' do
        before do
          if Object.const_defined? 'ApplicationHelper'
            @application_helper = ApplicationHelper
            Object.__send__ :remove_const, 'ApplicationHelper'
          end
        end

        after do
          if defined?(@application_helper)
            ApplicationHelper = @application_helper
          end
        end

        it 'operates normally' 

      end
    end

    describe "routes helpers collides with asset helpers" do
      let(:view_spec) do
        Class.new do
          include ActionView::Helpers::AssetTagHelper
          include ViewExampleGroup::ExampleMethods
        end.new
      end

      let(:test_routes) do
        ActionDispatch::Routing::RouteSet.new.tap do |routes|
          routes.draw { resources :images }
        end
      end

      it "uses routes helpers" 

    end

    describe "#render" do
      let(:view_spec) do
        Class.new do
          local = Module.new do
            def received
              @received ||= []
            end
            def render(options={}, local_assigns={}, &block)
              received << [options, local_assigns, block]
            end
            def _assigns
              {}
            end
          end
          include local
          include ViewExampleGroup::ExampleMethods
        end.new
      end

      context "given no input" do
        it "sends render(:template => (described file)) to the view" 


        it "converts the filename components into render options" 

      end

      context "given a string" do
        it "sends string as the first arg to render" 

      end

      context "given a hash" do
        it "sends the hash as the first arg to render" 

      end
    end

    describe '#params' do
      let(:view_spec) do
        Class.new do
          include ViewExampleGroup::ExampleMethods
          def controller
            @controller ||= Object.new
          end
        end.new
      end

      it 'delegates to the controller' 

    end

    describe "#_controller_path" do
      let(:view_spec) do
        Class.new do
          include ViewExampleGroup::ExampleMethods
        end.new
      end
      context "with a common _default_file_to_render" do
        it "it returns the directory" 

      end

      context "with a nested _default_file_to_render" do
        it "it returns the directory path" 

      end
    end

    describe "#view" do
      let(:view_spec) do
        Class.new do
          include ViewExampleGroup::ExampleMethods
        end.new
      end

      it "delegates to _view" 


      it 'is accessible to hooks' 

    end

    describe "#template" do
      let(:view_spec) do
        Class.new do
          include ViewExampleGroup::ExampleMethods
          def _view; end
        end.new
      end

      before { allow(RSpec).to receive(:deprecate) }

      it "is deprecated" 


      it "delegates to #view" 

    end

    describe '#stub_template' do
      let(:view_spec_group) do
        Class.new do
          include ViewExampleGroup::ExampleMethods
          def _view
            @_view ||= Struct.new(:view_paths).new(['some-path'])
          end
        end
      end

      it 'prepends an ActionView::FixtureResolver to the view path' 


      it 'caches FixtureResolver instances between example groups' 

    end
  end
end

