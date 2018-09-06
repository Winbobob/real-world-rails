require 'rails_helper'

require 'virus_scanners'

describe Services::VirusScanners::ClamAv do
  describe '#is_safe?' do
    context "given a safe file" do
      let(:file){ Rails.root.join('spec', 'support', 'fixtures', 'safe_file.txt') }

      it "returns true" 

    end

    context "given an unsafe file" do
      let(:file){ Rails.root.join('spec', 'support', 'fixtures', 'eicar_test_file.txt') }

      it "returns false" 

    end
  end
end

