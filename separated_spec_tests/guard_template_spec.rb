require "guard/compat/test/template"

# Do not require to simulate Guardfile loading more accurately
# require 'guard/rspec'

RSpec.describe "Guard::RSpec" do
  describe "template" do
    subject { Guard::Compat::Test::Template.new("Guard::RSpec") }

    it "matches spec files by default" 


    describe "mapping files to specs" do
      before do
        allow(Dir).to receive(:exist?).with("spec/lib").and_return(has_spec_lib)
      end

      context "when spec/lib exists" do
        let(:has_spec_lib) { true }
        it "matches Ruby files with files in spec/lib" 

      end

      context "when spec/lib does not exist" do
        let(:has_spec_lib) { false }
        it "matches Ruby files with files in spec/lib" 

      end
    end

    it "matches Rails files by default" 

  end
end

