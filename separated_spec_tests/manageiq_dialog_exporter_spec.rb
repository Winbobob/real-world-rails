describe TaskHelpers::DialogExporter do
  let(:dialog_yaml_serializer) { double("DialogYamlSerializer") }
  let(:dialog_exporter) { described_class.new(dialog_yaml_serializer) }

  describe "#export" do
    let(:file) { double }
    let(:filename) { "filename" }

    before do
      allow(File).to receive(:write)
      allow(dialog_yaml_serializer).to receive(:serialize).and_return("dialog_yaml")
      allow(Dialog).to receive(:all).and_return(["all the dialogs"])
    end

    it "exports the dialog yaml to the filename" 


    it "writes the serialized yaml to the file" 

  end
end

