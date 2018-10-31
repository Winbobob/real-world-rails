require 'spec_helper'

describe ScrapersHelper do
  describe "#is_url?" do
    it { expect(helper.is_url?("foobar")).to eq false }
    it { expect(helper.is_url?("http://example.com blah")).to eq false }
    it { expect(helper.is_url?("ftp://example.com/no_ftp")).to eq false }
    it { expect(helper.is_url?('<a href="http://example.com">blah</a>')).to eq false }
    it { expect(helper.is_url?("http://example.com")).to eq true }
    it { expect(helper.is_url?("http://example.com/#anchor")).to eq true }
  end

  describe "#scraper_description" do
    let(:scraper) { Scraper.new }
    let(:last_run) { mock_model(Run) }
    let(:foo_domain) { mock_model(Domain, name: "foo.com") }
    let(:bar_domain) { mock_model(Domain, name: "bar.com") }
    let(:www_foo_domain) { mock_model(Domain, name: "www.foo.com") }
    let(:www_bar_domain) { mock_model(Domain, name: "www.bar.com") }
    let(:fiddle_domain) { mock_model(Domain, name: "fiddle.com") }

    context "scraper description is blank" do
      it { expect(helper.scraper_description(scraper)).to eq 'A scraper to collect structured data from the web.' }
    end

    context "scraper description is blank and has one scraped domain" do
      before :each do
        allow(scraper).to receive(:last_run).and_return(last_run)
        allow(scraper).to receive(:scraped_domains).and_return([foo_domain])
      end

      it { expect(helper.scraper_description(scraper)).to eq 'A scraper to collect structured data from foo.com.' }
    end

    context "scraper description is blank and has five scraped domains" do
      before :each do
        allow(scraper).to receive(:last_run).and_return(last_run)
        allow(scraper).to receive(:scraped_domains).and_return([foo_domain, bar_domain, www_foo_domain, www_bar_domain, fiddle_domain])
      end

      it { expect(helper.scraper_description(scraper)).to eq 'A scraper to collect structured data from foo.com, bar.com, www.foo.com, and 2 other domains.' }
    end

    context "scraper description is not blank" do
      before :each do
        allow(scraper).to receive(:description).and_return('Foo bar')
      end

      it { expect(helper.scraper_description(scraper)).to eq 'Foo bar' }
    end
  end
end

