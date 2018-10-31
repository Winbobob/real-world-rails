require 'spec_helper'

describe 'String#extract_emails' do

  context "valid" do
    it "extracts single email from: pablo@teambox.com" 


    it "extracts multiple emails from: c@c.com word d@d.com\ne@f.com" 


    it "extracts header-style emails from: 'Pablo' <pablo2@teambox.com>, 'Juan Jaramillo'" 


    it "handles two-part TLD from: james@cuppadev.co.uk" 


    it "doesn't munge the username part from: a.fish@example.co.uk" 


    it "handles plus-addressing from: ohyeah+teambox@gmail.com" 


    it "extracts email with numbers from: l3tt3rsAndNumb3rs@domain.com" 


    it "extracts email with dash from: has-dash@domain.com" 


    it "doesn't trip on an apostrophe from: hasApostrophe.o'leary@domain.org" 


    it "doesn't extract leading apostrophe from: 'hello@domain.org'" 


    it "extracts the email with a 'travel' TLD from: uncommon@domain.travel" 


    it "extracts the email with numbers in domain from: numbers@911.com" 


    it "extracts the email with uppercase domain from: hello@gMAIL.COM" 


    it "handles domain specified with an IP & port from: IPAndPort@127.0.0.1:25" 


    it "extracts email with subdomains from: subdomain@sub.domain.com" 


    it "doesn't trip on whacky characters from: ~&*=?^+{}'@validCharsInLocal.net" 

  end

  context "invalid" do
    it "doesn't extract invalid email from: inv@lid brr" 


    it "detects missing domain from: missingDomain@.com" 


    it "trips on missing dot from: missingDot@com" 


    it "dislikes two @ signs from: two@@signs.com" 


    it "can't handle missing TLD from: missingTLD@domain." 

  end

  context "destructive" do
    it "should remove the emails from the original string" 

  end

  protected

  def subject
    data = description.match(/from: (.+)$/m)[1]
    data.extract_emails
  end

end


