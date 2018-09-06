describe BaseDecorator do
  def escape(str)
    # equivalent to what's used in templates
    ERB::Util.html_escape(str)
  end

  describe '.combine_html' do
    it "escapes content" 

  end
end

