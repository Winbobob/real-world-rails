module RSpec::Core
  RSpec.describe FilterManager do
    def opposite(name)
      name =~ /^in/ ? name.sub(/^(in)/,'ex') : name.sub(/^(ex)/,'in')
    end

    subject(:filter_manager) { FilterManager.new }
    let(:inclusions) { filter_manager.inclusions }
    let(:exclusions) { filter_manager.exclusions }

    def prune(examples)
      # We want to enforce that our FilterManager, like a good citizen,
      # leaves the input array unmodified. There are a lot of code paths
      # through the filter manager, so rather than write one
      # `it 'does not mutate the input'` example that would not cover
      # all code paths, we're freezing the input here in order to
      # enforce that for ALL examples in this file that call `prune`,
      # the input array is not mutated.
      filter_manager.prune(examples.freeze)
    end

    %w[include inclusions exclude exclusions].each_slice(2) do |name, type|
      describe "##{name}" do
        subject(:rules) { send(type).rules }
        let(:opposite_rules) { send(opposite(type)).rules }

        it "merges #{type}" 


        it "overrides previous #{type} with (via merge)" 


        it "deletes matching opposites" 


        if name == "include"
          context "with :full_description" do
            it "clears previous inclusions" 


            it "clears previous exclusion" 


            it "does nothing when :full_description previously set" 

          end
        end
      end

      describe "##{name}_only" do
        subject(:rules) { send(type).rules }
        let(:opposite_rules) { send(opposite(type)).rules }

        it "replaces existing #{type}" 


        it "deletes matching opposites" 

      end

      describe "##{name}_with_low_priority" do
        subject(:rules) { send(type).rules }
        let(:opposite_rules) { send(opposite(type)).rules }

        it "ignores new #{type} if same key exists" 


        it "ignores new #{type} if same key exists in opposite" 


        it "keeps new #{type} if same key exists in opposite but values are different" 

      end
    end

    describe "#prune" do
      def example_with(*args)
        RSpec.describe("group", *args).example("example")
      end

      shared_examples_for "example identification filter preference" do |type|
        it "prefers #{type} filter to exclusion filter" 


        it "prefers #{type} on entire group to exclusion filter on a nested example" 


        it "still applies inclusion filters to examples from files with no #{type} filters" 


        it "skips examples in external files when included from a #{type} filtered file" 

      end

      describe "location filtering" do
        include_examples "example identification filter preference", :location do
          def add_filter(options)
            filter_manager.add_location(__FILE__, [options.fetch(:line_number)])
          end
        end
      end

      describe "id filtering" do
        include_examples "example identification filter preference", :id do
          def add_filter(options)
            filter_manager.add_ids(__FILE__, [options.fetch(:scoped_id)])
          end
        end
      end

      context "with a location and an id filter" do
        it 'takes the set union of matched examples' 

      end

      context "with examples from multiple spec source files" do
        it "applies exclusions only to examples defined in files with no location filters" 

      end

      it "prefers description to exclusion filter" 


      it "includes objects with tags matching inclusions" 


      it "excludes objects with tags matching exclusions" 


      it "prefers exclusion when matches previously set inclusion" 


      it "prefers inclusion when matches previously set exclusion" 


      it "prefers previously set inclusion when exclusion matches but has lower priority" 


      it "prefers previously set exclusion when inclusion matches but has lower priority" 


      context "with multiple inclusion filters" do
        it 'includes objects that match any of them' 

      end

      context "with :id filters" do
        it 'selects only the matched example when a single example id is given' 


        it 'can work with absolute file paths' 


        it "can work with relative paths that lack the leading `.`" 


        it 'can select groups' 


        it 'uses the rerun file path when applying the id filter' 

      end
    end

    describe "#inclusions#description" do
      subject(:description) { inclusions.description }

      it 'cleans up the description' 

    end

    describe "#exclusions#description" do
      subject(:description) { exclusions.description }

      it 'cleans up the description' 


      it 'returns `{}` when it only contains the default filters' 


      it 'includes other filters' 


      it 'includes an overriden :if filter' 


      it 'includes an overriden :unless filter' 

    end

    describe ":if and :unless ExclusionFilters" do
      def example_with_metadata(metadata)
        value = nil
        RSpec.describe("group") do
          value = example('arbitrary example', metadata)
        end
        value
      end

      def exclude?(example)
        prune([example]).empty?
      end

      describe "the default :if filter" do
        it "does not exclude a spec with  { :if => true } metadata" 


        it "excludes a spec with  { :if => false } metadata" 


        it "excludes a spec with  { :if => nil } metadata" 


        it "continues to be an exclusion even if exclusions are cleared" 

      end

      describe "the default :unless filter" do
        it "excludes a spec with  { :unless => true } metadata" 


        it "does not exclude a spec with { :unless => false } metadata" 


        it "does not exclude a spec with { :unless => nil } metadata" 


        it "continues to be an exclusion even if exclusions are cleared" 

      end
    end
  end
end

