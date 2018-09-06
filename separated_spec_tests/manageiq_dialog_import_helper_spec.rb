describe TaskHelpers::DialogImportHelper do
  let(:dialog_import_service) { double("DialogImportService") }
  let(:dialog_import_helper) { described_class.new(dialog_import_service) }

  describe "#import" do
    let(:filename) { "filename" }

    before do
      allow($log).to receive(:info)
      allow(Kernel).to receive(:puts)
    end

    it "logs a message for yielded results" 


    it "delegates to the dialog_import_service" 

  end
end

