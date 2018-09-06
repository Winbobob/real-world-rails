# -*- encoding : utf-8 -*-
require "spec_helper"
require "external_command"

def mail_reply_test(email_filename)
  Dir.chdir Rails.root do
    xc = ExternalCommand.new("script/handle-mail-replies", "--test",
                             :stdin_string => load_file_fixture(email_filename))
    xc.run
    expect(xc.err).to eq("")
    return xc
  end
end

describe "When filtering" do

  describe "when not in test mode" do

    it "should not fail handling a bounce mail" 


    it 'should not fail handling a UTF8 encoded mail' 

  end

  it "should detect an Exim bounce" 


  it "should detect a WebShield delivery error message" 


  it "should detect a MS Exchange non-permanent delivery error message" 


  it "should pass on a non-bounce message" 


  it "should detect a multipart bounce" 


  it "should detect a generic out-of-office" 


  it "should detect an Exchange-style out-of-office" 


  it "should detect a Lotus Domino-style out-of-office" 


  it "should detect a Messagelabs-style out-of-office" 


  it "should detect an out-of-office that has an X-POST-MessageClass header" 


  it "should detect an Outlook(?)-style out-of-office" 


  it "should detect an ABCMail-style out-of-office" 

end

