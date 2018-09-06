# frozen_string_literal: true

require "rails_helper"

RSpec.describe "rss" do
  include Rack::Test::Methods

  let!(:post_1) do
    FactoryBot.create :post,
                      body: 'foo **a**',
                      title: 'bar',
                      created_at: Time.utc(2014, 3, 12, 12, 32, 42)
  end

  let!(:post_2) do
    FactoryBot.create :sticky_post,
                      body: '[link](http://google.de)',
                      title: 'sticky post',
                      created_at: Time.utc(2014, 3, 14, 11, 18, 0)
  end

  describe "posts" do
    before do
      get rss_path, format: :xml
    end

    it "returns all titles" 


    it "returns all descriptions converted to HTML and wrapped in CDATA" 


    it "returns all publication dates as rfc822" 

  end

  def xml_response
    Oga.parse_xml(last_response.body)
  end

  def xml_nodes_at(xpath)
    xml_response.xpath(xpath)
  end

  def xml_contents_at(xpath)
    xml_nodes_at(xpath).map(&:text)
  end
end

