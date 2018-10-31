module RSpec
  module Core
    RSpec.describe MetadataFilter do
      describe ".filter_applies?" do
        attr_accessor :parent_group_metadata, :group_metadata, :example_metadata

        def create_metadatas
          container = self

          RSpec.describe "parent group", :caller => ["/foo_spec.rb:#{__LINE__}"] do; container.parent_group_metadata = metadata
            describe "group", :caller => ["/foo_spec.rb:#{__LINE__}"] do; container.group_metadata = metadata
              container.example_metadata = it("example", :caller => ["/foo_spec.rb:#{__LINE__}"], :if => true).metadata
            end
          end
        end

        let(:world) { World.new }

        before do
          allow(RSpec).to receive(:world) { world }
          create_metadatas
        end

        def filter_applies?(key, value, metadata)
          MetadataFilter.filter_applies?(key, value, metadata)
        end

        context "with locations" do
          let(:condition_key){ :locations }
          let(:parent_group_condition) do
            {File.expand_path(parent_group_metadata[:file_path]) => [parent_group_metadata[:line_number]]}
          end
          let(:group_condition) do
            {File.expand_path(group_metadata[:file_path]) => [group_metadata[:line_number]]}
          end
          let(:example_condition) do
            {File.expand_path(example_metadata[:file_path]) => [example_metadata[:line_number]]}
          end
          let(:between_examples_condition) do
            {File.expand_path(group_metadata[:file_path]) => [group_metadata[:line_number] + 1]}
          end
          let(:next_example_condition) do
            {File.expand_path(example_metadata[:file_path]) => [example_metadata[:line_number] + 2]}
          end

          let(:preceeding_declaration_lines) {{
            parent_group_metadata[:line_number] => parent_group_metadata[:line_number],
            group_metadata[:line_number] => group_metadata[:line_number],
            example_metadata[:line_number] => example_metadata[:line_number],
            (example_metadata[:line_number] + 1) => example_metadata[:line_number],
            (example_metadata[:line_number] + 2) => example_metadata[:line_number] + 2,
          }}

          before do
            expect(world).to receive(:preceding_declaration_line).at_least(:once) do |_file_name, line_num|
              preceeding_declaration_lines[line_num]
            end
          end

          it "matches the group when the line_number is the example group line number" 


          it "matches the example when the line_number is the grandparent example group line number" 


          it "matches the example when the line_number is the parent example group line number" 


          it "matches the example when the line_number is the example line number" 


          it "matches when the line number is between this example and the next" 


          it "does not match when the line number matches the next example" 

        end

        it "matches a proc with no arguments that evaluates to true" 


        it "matches a proc that evaluates to true" 


        it "does not match a proc that evaluates to false" 


        it "matches a proc with an arity of 2" 


        it "raises an error when the proc has an incorrect arity" 


        it "matches an arbitrary object that has implemented `===` for matching" 


        context "with an :ids filter" do
          it 'matches examples with a matching id and rerun_file_path' 


          it 'does not match examples without a matching id' 


          it 'does not match examples without a matching rerun_file_path' 


          it 'matches the scoped id from a parent example group' 


          it 'matches only on entire id segments so (1 is not treated as a parent group of 11)' 

        end

        context "with a nested hash" do
          it 'matches when the nested entry matches' 


          it 'does not match when the nested entry does not match' 


          it 'does not match when the metadata lacks the key' 


          it 'does not match when the metadata does not have a hash entry for the key' 


          it 'matches when a metadata key is specified without a value and exists in the metadata hash' 

        end

        context "with an Array" do
          let(:metadata_with_array) do
            meta = nil
            RSpec.describe("group") do
              meta = example('example_with_array', :tag => [:one, 2, 'three', /four/]).metadata
            end
            meta
          end

          it "matches a symbol" 


          it "matches a string" 


          it "matches an integer" 


          it "matches a regexp" 


          it "matches a proc that evaluates to true" 


          it "does not match a proc that evaluates to false" 


          it 'matches when a metadata key is specified without a value and exists in the metadata hash' 

        end
      end
    end
  end
end

