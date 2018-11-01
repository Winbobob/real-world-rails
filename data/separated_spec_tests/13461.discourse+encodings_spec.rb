require 'rails_helper'

describe Encodings do
  def to_utf8(filename)
    string = File.read("#{Rails.root}/spec/fixtures/encodings/#{filename}").chomp
    Encodings.to_utf8(string)
  end

  context "unicode" do
    let(:expected) { 'Το σύστημα γραφής είναι ένα συμβολικό, οπτικό σύστημα καταγραφής της γλώσσας.' }

    it "correctly encodes UTF-8 as UTF-8" 


    it "correctly encodes UTF-8 with BOM as UTF-8" 


    it "correctly encodes UTF-16LE with BOM as UTF-8" 


    it "correctly encodes UTF-16BE with BOM as UTF-8" 

  end

  it "correctly encodes ISO-8859-5 as UTF-8" 

end

