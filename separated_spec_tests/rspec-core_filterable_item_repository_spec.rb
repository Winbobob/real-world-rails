module RSpec
  module Core
    RSpec.describe FilterableItemRepository, "#items_for" do
      FilterableItem = Struct.new(:name)

      def self.it_behaves_like_a_filterable_item_repo(&when_the_repo_has_items_with_metadata)
        let(:repo)   { described_class.new(:any?) }
        let(:item_1) { FilterableItem.new("Item 1") }
        let(:item_2) { FilterableItem.new("Item 2") }
        let(:item_3) { FilterableItem.new("Item 3") }
        let(:item_4) { FilterableItem.new("Item 4") }

        context "when the repository is empty" do
          it 'returns an empty list' 

        end

        shared_examples_for "adding items to the repository" do |add_method|
          describe "adding items using `#{add_method}`" do
            define_method :add_item do |*args|
              repo.__send__ add_method, *args
            end

            context "when the repository has items that have no metadata" do
              before do
                add_item item_1, {}
                add_item item_2, {}
              end

              it "returns those items, regardless of the provided argument" 

            end

            context "when the repository has items that have metadata" do
              before do
                add_item item_1, :foo => "bar"
                add_item item_2, :slow => true
                add_item item_3, :foo => "bar"
              end

              it 'return an empty list when given empty metadata' 


              it 'return an empty list when given metadata that matches no items' 


              it 'returns matching items for the provided metadata' 


              it 'returns the matching items in the correct order' 


              it 'ignores other metadata keys that are not related to the appended items' 


              it 'differentiates between an applicable key being missing and having an explicit `nil` value' 


              it 'returns the correct items when they are appended after a memoized lookup' 


              let(:flip_proc) do
                return_val = true
                Proc.new { return_val.tap { |v| return_val = !v } }
              end

              context "with proc values" do
                before do
                  add_item item_4, { :include_it => flip_proc }
                end

                it 'evaluates the proc each time since the logic can return a different value each time' 

              end

              context "when initialized with the `:any?` predicate" do
                let(:repo) { FilterableItemRepository::QueryOptimized.new(:any?) }

                it 'matches against multi-entry items when any of the metadata entries match' 

              end

              context "when initialized with the `:all?` predicate" do
                let(:repo) { FilterableItemRepository::QueryOptimized.new(:all?) }

                it 'matches against multi-entry items when all of the metadata entries match' 

              end

              module_eval(&when_the_repo_has_items_with_metadata) if when_the_repo_has_items_with_metadata
            end
          end
        end

        it_behaves_like "adding items to the repository", :append do
          let(:items_in_expected_order) { [item_1, item_2, item_3] }
        end

        it_behaves_like "adding items to the repository", :prepend do
          let(:items_in_expected_order) { [item_3, item_2, item_1] }
        end

        describe '#delete' do
          before do
            repo.append item_1, {}
            repo.append item_1, :foo => true
            repo.append item_1, :foo => true, :bar => true
            repo.append item_2, :foo => true
          end

          it 'deletes the specified item with the metadata' 

        end
      end

      describe FilterableItemRepository::UpdateOptimized do
        it_behaves_like_a_filterable_item_repo
      end

      describe FilterableItemRepository::QueryOptimized do
        it_behaves_like_a_filterable_item_repo do
          describe "performance optimization" do
            # NOTE: the specs in this context are potentially brittle because they are
            # coupled to the implementation's usage of `MetadataFilter.apply?`. However,
            # they demonstrate the perf optimization that was the reason we created
            # this class, and thus have value in demonstrating the memoization is working
            # properly and in documenting the reason the class exists in the first place.
            # Still, if these prove to be brittle in the future, feel free to delete them since
            # they are not concerned with externally visible behaviors.

            it 'is optimized to check metadata filter application for a given pair of metadata hashes only once' 


            it 'ignores extraneous metadata keys when doing memoized lookups' 


            context "when there are some proc keys" do
              before do
                add_item item_4, { :include_it => flip_proc }
              end

              it 'still performs memoization for metadata hashes that lack those keys' 

            end

            def track_metadata_filter_apply_calls
              Hash.new(0).tap do |call_counts|
                allow(MetadataFilter).to receive(:apply?).and_wrap_original do |original, predicate, item_meta, request_meta|
                  call_counts[item_meta] += 1
                  original.call(predicate, item_meta, request_meta)
                end
              end
            end
          end
        end
      end
    end
  end
end

