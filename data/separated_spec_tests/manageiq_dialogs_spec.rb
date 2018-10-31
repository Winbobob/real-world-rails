require "rake"

describe "dialogs" do
  let(:task_path) { "lib/tasks/dialogs" }

  describe "import", :type => :rake_task do
    let(:dialog_import_helper) { double("TaskHelpers::DialogImportHelper") }

    before do
      allow(TaskHelpers::DialogImportHelper).to receive(:new).and_return(dialog_import_helper)
    end

    it "depends on the environment" 


    it "delegates to a dialog import helper" 

  end

  describe "export", :type => :rake_task do
    let(:dialog_exporter) { double("TaskHelpers::DialogExporter") }

    before do
      allow(TaskHelpers::DialogExporter).to receive(:new).and_return(dialog_exporter)
    end

    it "depends on the environment" 


    context "with a given filename" do
      it "delegates to a dialog exporter with the given filename" 

    end

    context "without a given filename" do
      it "delegates to a dialog exporter with a default filename and timestamp" 

    end
  end
end

