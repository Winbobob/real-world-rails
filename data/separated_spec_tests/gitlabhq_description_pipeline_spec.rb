require 'rails_helper'

describe Banzai::Pipeline::DescriptionPipeline do
  def parse(html)
    # When we pass HTML to Redcarpet, it gets wrapped in `p` tags...
    # ...except when we pass it pre-wrapped text. Rabble rabble.
    unwrap = !html.start_with?('<p ')

    output = described_class.to_html(html, project: spy)

    output.gsub!(%r{\A<p dir="auto">(.*)</p>(.*)\z}, '\1\2') if unwrap

    output
  end

  it 'uses a limited whitelist' 


  %w(pre code img ol ul li).each do |elem|
    it "removes '#{elem}' elements" 

  end

  %w(b i strong em a ins del sup sub).each do |elem|
    it "still allows '#{elem}' elements" 

  end

  it "still allows 'p' elements" 

end

