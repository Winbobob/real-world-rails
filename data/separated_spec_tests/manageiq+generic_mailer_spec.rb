describe GenericMailer do
  before do
    @miq_server = EvmSpecHelper.local_miq_server
    @args = {
      :to      => "you@bedrock.gov",
      :from    => "me@bedrock.gov",
      :subject => "GenericMailerTests",
      :body    => "testing123"
    }
    ActionMailer::Base.deliveries.clear
  end

  context 'with a notifier within a region' do
    before do
      MiqRegion.seed
      ServerRole.seed
      @miq_server.server_roles << ServerRole.where(:name => 'notifier')
      @miq_server.save!
    end

    it "call deliver_queue for generic_notification" 


    it "call deliver_queue for automation_notification" 

  end

  context 'without a notifier within a region' do
    before { MiqRegion.seed }

    it 'does not queue any mail notifications' 

  end

  context "delivery error" do
    it "call attempts to send message to recipients indivually" 

  end

  context "connection error" do
    it "returns gracefully" 

  end

  it "call deliver for generic_notification" 


  it "call deliver for generic_notification without a 'from' address" 


  it "call deliver for automation_notification" 


  it "call deliver for automation_notification with attachment as BinaryBlob" 


  it "call deliver for automation_notification, with attachment as BinaryBlob, and generate filenames" 


  it "call blob_to_attachment and attachment_to_blob" 


  it "call blob_to_attachment and attachment_to_blob and generate attachment filenames" 


  it "call blob_to_attachment and attachment_to_blob and do not generate attachment filenames" 


  it "call deliver for generic_notification with text/plain attachment" 


  it "call deliver for generic_notification with text/html attachment" 


  it "call automation_notification directly" 


  it "call generic_notification directly" 


  it "policy_action_email" 


  describe "#test_mail" do
    it "should be called directly" 


    it "should not change the input parameters" 

  end
end

