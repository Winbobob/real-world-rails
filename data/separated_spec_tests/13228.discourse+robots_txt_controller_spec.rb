require 'rails_helper'

RSpec.describe RobotsTxtController do
  describe '#builder' do
    it "returns json information for building a robots.txt" 

  end

  describe '#index' do

    context 'subfolder' do
      it 'prefixes the rules with the directory' 

    end

    context 'crawl delay' do
      it 'allows you to set crawl delay on particular bots' 

    end

    context 'allow_index_in_robots_txt is true' do

      def expect_allowed_and_disallowed_sections(allow_index, disallow_index)
        expect(allow_index).to be_present
        expect(disallow_index).to be_present

        allow_section = allow_index < disallow_index ?
          response.body[allow_index...disallow_index] : response.body[allow_index..-1]

        expect(allow_section).to include('Disallow: /u/')
        expect(allow_section).to_not include("Disallow: /\n")

        disallowed_section = allow_index < disallow_index ?
          response.body[disallow_index..-1] : response.body[disallow_index...allow_index]
        expect(disallowed_section).to include("Disallow: /\n")
      end

      it "returns index when indexing is allowed" 


      it "can whitelist user agents" 


      it "can blacklist user agents" 


      it "ignores blacklist if whitelist is set" 

    end

    it "returns noindex when indexing is disallowed" 

  end
end

