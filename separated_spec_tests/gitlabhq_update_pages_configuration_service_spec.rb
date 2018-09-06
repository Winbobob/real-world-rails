require 'spec_helper'

describe Projects::UpdatePagesConfigurationService do
  let(:project) { create(:project) }
  subject { described_class.new(project) }

  describe "#update" do
    let(:file) { Tempfile.new('pages-test') }

    after do
      file.close
      file.unlink
    end

    it 'updates the .update file' 

  end
end

