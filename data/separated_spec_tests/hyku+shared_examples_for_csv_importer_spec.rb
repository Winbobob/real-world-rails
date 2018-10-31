RSpec.shared_examples "csv_importer" do
  context "with a file" do
    let(:attributes) do
      {
        id: "123",
        title: ["Gluten-free umami"],
        file: ["world.png"]
      }
    end
    let(:factory) { described_class.new(attributes, 'spec/fixtures/images') }

    before { factory.run }

    describe "#run" do
      it "uploads the content of the file" 

    end

    describe "when a work with the same id already exists" do
      let(:new_attr) do
        {
          id: "123",
          title: ["Squid tofu banjo"],
          file: ["nypl-hydra-of-lerna.jpg"]
        }
      end

      it "updates metadata" 

    end
  end

  context "without a file" do
    ## the csv_importer still creates a Work when no file is provided.
    ## TO DO: handle invalid file in CSV; current behavior:
    ## the importer stops if no file corresponding to a given file_name is found
    let(:attributes) { { id: "345", title: ["Artisan succulents"] } }
    let(:factory) { described_class.new(attributes) }

    before { factory.run }

    it "creates a Work with supplied metadata" 


    it "updates a Work with supplied metadata" 

  end
end

