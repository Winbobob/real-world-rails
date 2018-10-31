require 'rails_helper'

RSpec.describe "errors:precompile", type: :task do
  let(:public_path) { Pathname.new(Dir.mktmpdir) }
  let(:public_files) { public_path.entries.map(&:to_s) }

  before do
    allow(Rails).to receive(:public_path).and_return(public_path)

    subject.invoke
  end

  after do
    FileUtils.remove_entry(public_path)
  end

  it "renders the error pages" 

end

