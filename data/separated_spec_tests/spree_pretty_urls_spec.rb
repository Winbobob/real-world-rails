require 'filters/pretty_urls'

describe PrettyUrls do
  subject { PrettyUrls.new }
  context "correctly translating" do
    it "[Foo Bar](foo_bar) => /foo_bar.html" 


    it "[Foo Bar](foo_bar.html) => /foo_bar.html" 


    it "[Foo Bar](foo_bar#buzz) => /foo_bar.html#buzz" 


    it "[Foo Bar](foo_bar.html#buzz) => /foo_bar.html#buzz" 

  end
end

