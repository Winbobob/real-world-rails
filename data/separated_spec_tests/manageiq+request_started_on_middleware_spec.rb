describe RequestStartedOnMiddleware do
  context ".long_running_requests" do
    before do
      allow(described_class).to receive(:relevant_thread_list) { fake_threads }
      allow(described_class).to receive(:request_timeout).and_return(2.minutes)
    end

    let(:fake_threads) { [@fake_thread] }

    it "returns request, duration and thread" 


    it "skips threads that haven't timed out yet" 


    it "skips threads with no requests" 

  end
end

