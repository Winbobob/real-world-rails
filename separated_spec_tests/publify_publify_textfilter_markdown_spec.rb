require 'rails_helper'

describe PublifyApp::Textfilter::Markdown do
  def filter_text(text)
    described_class.filtertext(text)
  end

  it 'applies markdown processing to the supplied text' 

end

