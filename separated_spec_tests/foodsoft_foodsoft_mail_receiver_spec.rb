require_relative '../spec_helper'

describe FoodsoftMailReceiver do

  before :all do
    @server = FoodsoftMailReceiver.new 0
    @server.start
  end

  it 'does not accept empty addresses' 


  it 'does not accept invalid addresses' 


  it 'does not accept invalid scope in address' 


  it 'does not accept address without handler' 


  it 'does not accept invalid addresses via SMTP' 


  it 'does not accept invalid addresses via SMTP' 


  # TODO: Reanable this test.
  # It raised "Mysql2::Error: Lock wait timeout exceeded" at time of writing.
  # it 'accepts bounce mails via SMTP' do
  #   MailDeliveryStatus.delete_all
  #
  #   Net::SMTP.start(@server.host, @server.port) do |smtp|
  #     address = "#{FoodsoftConfig[:default_scope]}.bounce+user=example.com"
  #     smtp.send_message 'report', 'from@example.com', address
  #   end
  #
  #   mds = MailDeliveryStatus.last
  #   expect(mds.email).to eq 'user@example.com'
  #   expect(mds.attachment_mime).to eq 'message/rfc822'
  #   expect(mds.attachment_data).to include 'report'
  # end

  after :all do
    @server.shutdown
  end

end

