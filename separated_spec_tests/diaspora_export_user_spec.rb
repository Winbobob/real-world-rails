# frozen_string_literal: true

describe Workers::ExportUser do
  before do
    allow(User).to receive(:find).with(alice.id).and_return(alice)
  end

  it 'calls export! on user with given id' 


  it 'sends a success message when the export is successful' 


  it 'sends a failure message when the export fails' 


  context "concurrency" do
    before do
      AppConfig.environment.single_process_mode = false
      AppConfig.settings.export_concurrency = 1
    end

    after :all do
      AppConfig.environment.single_process_mode = true
    end

    let(:pid) { "#{Socket.gethostname}:#{Process.pid}:#{SecureRandom.hex(6)}" }

    it "schedules a job for later when already another parallel export job is running" 


    it "runs the export when the own running job" 


    it "runs the export when no other job is running" 


    it "runs the export when some other job is running" 


    it "runs the export when diaspora is in single process mode" 

  end
end

