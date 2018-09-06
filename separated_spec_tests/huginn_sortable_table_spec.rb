require 'rails_helper'

describe SortableTable do
  class SortableTestController
    attr_accessor :params

    def self.helper(foo)
    end

    include SortableTable

    public :set_table_sort
    public :table_sort
  end

  describe "#set_table_sort" do
    let(:controller) { SortableTestController.new }
    let(:default) { { column2: :asc }}
    let(:options) { { sorts: %w[column1 column2], default: default } }

    it "uses a default when no sort is given" 


    it "applies the given sort when one is passed in" 


    it "ignores unknown directions" 


    it "ignores unknown columns" 

  end
end

