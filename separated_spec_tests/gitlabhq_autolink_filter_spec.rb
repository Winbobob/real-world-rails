require 'spec_helper'

describe Banzai::Filter::AutolinkFilter do
  include FilterSpecHelper

  let(:link) { 'http://about.gitlab.com/' }
  let(:quotes) { ['"', "'"] }

  it 'does nothing when :autolink is false' 


  it 'does nothing with non-link text' 


  context 'Various schemes' do
    it 'autolinks http' 


    it 'autolinks https' 


    it 'autolinks ftp' 


    it 'autolinks short URLs' 


    it 'autolinks multiple URLs' 


    it 'accepts link_attr options' 


    it 'autolinks smb' 


    it 'autolinks multiple occurences of smb' 


    it 'autolinks irc' 


    it 'autolinks rdar' 


    it 'does not autolink javascript' 


    it 'does not autolink bad URLs' 


    it 'does not include trailing punctuation' 


    it 'includes trailing punctuation when part of a balanced pair' 


    it 'removes trailing quotes' 


    it 'removes one closing punctuation mark when the punctuation in the link is unbalanced' 


    it 'does not double-encode HTML entities' 


    it 'does not include trailing HTML entities' 


    it 'accepts link_attr options' 


    described_class::IGNORE_PARENTS.each do |elem|
      it "ignores valid links contained inside '#{elem}' element" 

    end
  end

  context 'when the link is inside a tag' do
    %w[http rdar].each do |protocol|
      it "renders text after the link correctly for #{protocol}" 

    end
  end

  # Rinku does not escape these characters in HTML attributes, but content_tag
  # does. We don't care about that difference for these specs, though.
  def unescape(html)
    %w([ ] { }).each do |cgi_escape|
      html.sub!(CGI.escape(cgi_escape), cgi_escape)
    end

    quotes.each do |html_escape|
      html.sub!(CGI.escape_html(html_escape), html_escape)
      html.sub!(CGI.escape(html_escape), CGI.escape_html(html_escape))
    end

    html
  end
end

