describe TabularData::Container do
  before(:all) { DatabaseCleaner.strategy = :truncation }
  after(:all) { DatabaseCleaner.strategy = :transaction }

  describe "#initialize" do
    it "sets the columns" 


    it "does not modify the query if there are no joins" 


    it "aliases direct joins" 


    it "aliases indirect joins" 


    it "sets sort" 


    it "allows the sort to be frozen" 

  end

  describe "#alter_query" do
    it "allows the query to be modified" 

  end

  describe "#state_from_params=" do
    let(:container) do
      config = {
        engine: "Proposal",
        column_configs: { id: true, client: { virtual: true } },
        columns: %w(id client)
      }
      TabularData::Container.new(:abc, config)
    end

    it "sets sort state if the field is valid" 


    it "ignores invalid sorts" 

  end

  describe "#apply_limit" do
    it "constrains the query to :limit" 

  end

  describe "#apply_offset" do
    it "constrains the query to a specific starting point" 

  end

  describe "#total" do
    it "gets grand total regardless of page size" 

  end

  describe "#size" do
    it "defaults to MAX_SEARCH_RESULTS" 

  end

  describe "#current_page" do
    it "does pagination math" 

  end

  describe "#from" do
    it "derives from page param" 

  end

  describe "#page" do
    it "uses params[:page]" 

  end

  describe "#total_pages" do
    it "does the pagination math" 

  end

  describe "#limit_value" do
    it "passes to #size" 

  end
end

