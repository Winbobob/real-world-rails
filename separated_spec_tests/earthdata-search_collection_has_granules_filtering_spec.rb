require 'spec_helper'

describe 'Collection has-granules filtering', reset: false do
  context 'When disabling the \'show collections without granules\' filter' do
    before :all do
      load_page :search

      @with_granules_collections_count = collection_results_header_value.text.to_i

      find(:css, '#has-granules').set(false)
      wait_for_xhr
    end

    it 'increases the number of collections returned' 


    context 'When re-enabling the \'show collections without granules\' filter' do
      before :all do
        @all_collections_count = collection_results_header_value.text.to_i

        find(:css, '#has-granules').set(true)
        wait_for_xhr
      end

      it 'decreases the number of collections returned' 

    end
  end
end

