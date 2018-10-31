# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe OutgoingMessages::DeliveryStatusesController do

  before do
    lines = <<-EOF.strip_heredoc.split("\n")
    2015-09-22 17:36:56 [2035] 1ZeQYq-0000Wm-1V => body@example.com F=<request@example.com> P=<request@example.com> R=dnslookup T=remote_smtp S=1685 H=mail.example.com [62.208.144.158]:25 C="250 2.0.0 Ok: queued as 95FC94583B8" QT=0s DT=0s\n
    2015-09-22 17:36:56 [2032] 1ZeQYq-0000Wm-1V <= request@example.com U=alaveteli P=local S=1645 id=ogm-12iu1h22@example.com T="An FOI Request about Potatoes" from <request@example.com> for body@example.com body@example.com\n
    2015-11-22 00:37:01 [17622] 1a0IeK-0004aB-Na => body@example.com <body@example.com> F=<request@example.com> P=<request@example.com> R=dnslookup T=remote_smtp S=4137 H=prefilter.emailsecurity.trendmicro.eu [150.70.226.147]:25 X=TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128 CV=no DN="C=US,ST=California,L=Cupertino,O=Trend Micro Inc.,CN=*.emailsecurity.trendmicro.eu" C="250 2.0.0 Ok: queued as 8878A680030" QT=1s DT=0s\n
    2015-11-22 00:37:00 [17619] 1a0IeK-0004aB-Na <= request@example.com U=alaveteli P=local S=3973 id=ogm-jh217mwec@example.com@localhost T="RE: An FOI Request about Potatoes 15" from <request@example.com> for body@example.com body@example.com\n
    EOF
    @logs = lines.map do |line|
      mock_model(MailServerLog, :line => line, :is_owning_user? => true)
    end
    @status = MailServerLog::DeliveryStatus.new(:delivered)
  end

  def visible_info_request
    mock_model(InfoRequest, { :prominence => 'normal',
                              :embargo => nil })
  end

  describe 'GET show' do

    it 'assigns the outgoing message' 


    it 'renders hidden when the message cannot be viewed' 


    it 'renders hidden when the request cannot be viewed' 


    it 'sets the title' 


    it 'assigns the delivery status of the message' 


    it 'sets show_mail_server_logs to true if the user is an owner' 


    it 'sets show_mail_server_logs to false if the user is not an owner' 


    it 'assigns the redacted mail server log lines for the request owner' 


    it 'assigns the unredacted mail server log lines for an admin' 


    it 'does not assign mail server logs for a regular user' 


    it 'renders the show template' 


  end

end

