# frozen_string_literal: true

# coding: utf-8
# Copyright (C) Bob Aman
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.


require "spec_helper"

# Have to use RubyGems to load the idn gem.
require "rubygems"

require "addressable/idna"

shared_examples_for "converting from unicode to ASCII" do
  it "should convert 'www.google.com' correctly" 


  long = 'AcinusFallumTrompetumNullunCreditumVisumEstAtCuadLongumEtCefallum.com'
  it "should convert '#{long}' correctly" 


  it "should convert 'www.詹姆斯.com' correctly" 


  it "should convert 'www.Iñtërnâtiônàlizætiøn.com' correctly" 


  it "should convert 'www.Iñtërnâtiônàlizætiøn.com' correctly" 


  it "should convert " +
      "'www.ほんとうにながいわけのわからないどめいんめいのらべるまだながくしないとたりない.w3.mag.keio.ac.jp' " +
      "correctly" do
    expect(Addressable::IDNA.to_ascii(
      "www.\343\201\273\343\202\223\343\201\250\343\201\206\343\201\253\343" +
      "\201\252\343\201\214\343\201\204\343\202\217\343\201\221\343\201\256" +
      "\343\202\217\343\201\213\343\202\211\343\201\252\343\201\204\343\201" +
      "\251\343\202\201\343\201\204\343\202\223\343\202\201\343\201\204\343" +
      "\201\256\343\202\211\343\201\271\343\202\213\343\201\276\343\201\240" +
      "\343\201\252\343\201\214\343\201\217\343\201\227\343\201\252\343\201" +
      "\204\343\201\250\343\201\237\343\202\212\343\201\252\343\201\204." +
      "w3.mag.keio.ac.jp"
    )).to eq(
      "www.xn--n8jaaaaai5bhf7as8fsfk3jnknefdde3" +
      "fg11amb5gzdb4wi9bya3kc6lra.w3.mag.keio.ac.jp"
    )
  end

  it "should convert " +
      "'www.ほんとうにながいわけのわからないどめいんめいのらべるまだながくしないとたりない.w3.mag.keio.ac.jp' " +
      "correctly" do
    expect(Addressable::IDNA.to_ascii(
      "www.\343\201\273\343\202\223\343\201\250\343\201\206\343\201\253\343" +
      "\201\252\343\201\213\343\202\231\343\201\204\343\202\217\343\201\221" +
      "\343\201\256\343\202\217\343\201\213\343\202\211\343\201\252\343\201" +
      "\204\343\201\250\343\202\231\343\202\201\343\201\204\343\202\223\343" +
      "\202\201\343\201\204\343\201\256\343\202\211\343\201\270\343\202\231" +
      "\343\202\213\343\201\276\343\201\237\343\202\231\343\201\252\343\201" +
      "\213\343\202\231\343\201\217\343\201\227\343\201\252\343\201\204\343" +
      "\201\250\343\201\237\343\202\212\343\201\252\343\201\204." +
      "w3.mag.keio.ac.jp"
    )).to eq(
      "www.xn--n8jaaaaai5bhf7as8fsfk3jnknefdde3" +
      "fg11amb5gzdb4wi9bya3kc6lra.w3.mag.keio.ac.jp"
    )
  end

  it "should convert '点心和烤鸭.w3.mag.keio.ac.jp' correctly" 


  it "should convert '가각갂갃간갅갆갇갈갉힢힣.com' correctly" 


  it "should convert " +
      "'\347\242\274\346\250\231\346\272\226\350" +
      "\220\254\345\234\213\347\242\274.com' correctly" do
    expect(Addressable::IDNA.to_ascii(
      "\347\242\274\346\250\231\346\272\226\350" +
      "\220\254\345\234\213\347\242\274.com"
    )).to eq("xn--9cs565brid46mda086o.com")
  end

  it "should convert 'ﾘ宠퐱〹.com' correctly" 


  it "should convert 'リ宠퐱卄.com' correctly" 


  it "should convert 'ᆵ' correctly" 


  it "should convert 'ﾯ' correctly" 


  it "should convert '🌹🌹🌹.ws' correctly" 


  it "should handle two adjacent '.'s correctly" 

end

shared_examples_for "converting from ASCII to unicode" do
  long = 'AcinusFallumTrompetumNullunCreditumVisumEstAtCuadLongumEtCefallum.com'
  it "should convert '#{long}' correctly" 


  it "should return the identity conversion when punycode decode fails" 


  it "should return the identity conversion when the ACE prefix has no suffix" 


  it "should convert 'www.google.com' correctly" 


  it "should convert 'www.詹姆斯.com' correctly" 


  it "should convert '詹姆斯.com' correctly" 


  it "should convert 'www.iñtërnâtiônàlizætiøn.com' correctly" 


  it "should convert 'iñtërnâtiônàlizætiøn.com' correctly" 


  it "should convert " +
      "'www.ほんとうにながいわけのわからないどめいんめいのらべるまだながくしないとたりない.w3.mag.keio.ac.jp' " +
      "correctly" do
    expect(Addressable::IDNA.to_unicode(
      "www.xn--n8jaaaaai5bhf7as8fsfk3jnknefdde3" +
      "fg11amb5gzdb4wi9bya3kc6lra.w3.mag.keio.ac.jp"
    )).to eq(
      "www.ほんとうにながいわけのわからないどめいんめいのらべるまだながくしないとたりない.w3.mag.keio.ac.jp"
    )
  end

  it "should convert '点心和烤鸭.w3.mag.keio.ac.jp' correctly" 


  it "should convert '가각갂갃간갅갆갇갈갉힢힣.com' correctly" 


  it "should convert " +
      "'\347\242\274\346\250\231\346\272\226\350" +
      "\220\254\345\234\213\347\242\274.com' correctly" do
    expect(Addressable::IDNA.to_unicode(
      "xn--9cs565brid46mda086o.com"
    )).to eq(
      "\347\242\274\346\250\231\346\272\226\350" +
      "\220\254\345\234\213\347\242\274.com"
    )
  end

  it "should convert 'リ宠퐱卄.com' correctly" 


  it "should convert 'ﾯ' correctly" 


  it "should convert '🌹🌹🌹.ws' correctly" 


  it "should handle two adjacent '.'s correctly" 


  it "should normalize 'string' correctly" 

end

describe Addressable::IDNA, "when using the pure-Ruby implementation" do
  before do
    Addressable.send(:remove_const, :IDNA)
    load "addressable/idna/pure.rb"
  end

  it_should_behave_like "converting from unicode to ASCII"
  it_should_behave_like "converting from ASCII to unicode"

  begin
    require "fiber"

    it "should not blow up inside fibers" 

  rescue LoadError
    # Fibers aren't supported in this version of Ruby, skip this test.
    warn('Fibers unsupported.')
  end
end

begin
  require "idn"

  describe Addressable::IDNA, "when using the native-code implementation" do
    before do
      Addressable.send(:remove_const, :IDNA)
      load "addressable/idna/native.rb"
    end

    it_should_behave_like "converting from unicode to ASCII"
    it_should_behave_like "converting from ASCII to unicode"
  end
rescue LoadError
  # Cannot test the native implementation without libidn support.
  warn('Could not load native IDN implementation.')
end

