require 'rails_helper'
require_dependency 'plugin/metadata'

describe Plugin::Metadata do
  context "parse" do
    it "correctly parses plugin info" 

  end

  def official(name)
    metadata = Plugin::Metadata.parse <<TEXT
# name: #{name}
TEXT

    expect(metadata.official?).to eq(true)
  end

  def unofficial(name)
    metadata = Plugin::Metadata.parse <<TEXT
# name: #{name}
TEXT

    expect(metadata.official?).to eq(false)
  end

  it "correctly detects official vs unofficial plugins" 


end

