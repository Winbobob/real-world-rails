require 'url_formatter'

describe UrlFormatter do

  describe '#original' do
    it "should return the given url" 

  end

  describe '#minimal' do
    it "should remove anchors and query parameters from url" 

    it "should remove all parameters except \"sid\" for eFiction sites" 

  end

  describe '#no_www' do
    it "should remove www from the url" 

    it "should remove www, query parameters and anchors from the url" 

  end

  describe '#with_www' do
    it "should add www to the url" 

    it "should add www to the url and remove query parameters and anchors" 

  end

  describe '#encoded' do
    it "should URI encode the url" 

  end

  describe '#decoded' do
    it "should URI decode the url" 

  end

  describe '#standardized' do
    it "should add http" 

    it "should downcase the domain" 

  end

end

