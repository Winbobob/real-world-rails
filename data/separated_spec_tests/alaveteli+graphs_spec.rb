# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../../lib/graphs')

describe Graphs do

  let(:dummy_class) { Class.new { extend Graphs } }

  describe "when asked to select data as columns" do

    let(:user1) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }

    it "returns an array containing arrays of column values" 


    it "returns an array containing single value arrays if there is a single result row" 


    it "returns nil if there are no results" 


    it "raises an error if there is a mistake in the SQL statement" 


  end

  describe "when asked to create a plottable dataset" do

    let(:test_data) { [["title 1", "title 2"], [42, 15], [42, 57]] }

    it "returns a Gnuplot::DataSet object" 


    it "uses the first 2 columns by default" 


    it "uses the supplied column references via the 'using' option" 


    it "sets the key title" 


    it "sets the plot type for the dataset via the 'with' option" 


    it "sets the line colour via the 'linecolor' option" 


    it "sets the line width via the 'linewidth' option" 


    it "sets the axes width via the 'axes' option" 

  end

  describe "when asked to plot data from sql" do

    let(:sql) { "SELECT name, id FROM users WHERE 1=0" }
    let(:test_data) { [["title 1", "title 2"], [42, 15], [42, 57]] }

    it "calls select_as_columns with the provided SQL" 


    it "does not call create_dataset if select_as_columns returns no data" 


    context "select_as_columns returns data" do

      it "calls create_dataset" 


      it "appends the created dataset to the supplied datasets collection" 


    end

  end

  describe "when asked to plot data from columns" do

    let(:test_data) { [["title 1", "title 2"], [42, 15], [42, 57]] }

    it "calls create_dataset with the supplied data" 


    it "appends the created dataset to the supplied datasets collection" 


    # odd but possible as the calling code may not have checked
    it "does not call create_dataset if the supplied data is null" 


  end

  describe "when asked to plot multiple datasets" do
    include Graphs

    let(:graph_def_1) do
      Graphs::GraphParams.new(
        "SELECT DATE(created_at), COUNT(*) FROM users GROUP BY DATE(created_at)",
        { :title => "test 1",
          :with => "lines",
          :linecolor => Graphs::COLOURS[:mauve] }
      )
    end

    let(:graph_def_2) do
      Graphs::GraphParams.new(
        "SELECT DATE(created_at), COUNT(*) FROM info_requests GROUP BY DATE(created_at)",
        { :title => "test 2",
          :with => "lines",
          :linecolor => Graphs::COLOURS[:red] }
      )
     end

    it "passes the sql and options for a set of params to plot_data_from_sql" 


    it "calls plot_data_from_sql for each set of data supplied" 


  end

end

