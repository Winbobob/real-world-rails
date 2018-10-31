RSpec.describe "expect(...).to satisfy { block }" do
  it_behaves_like "an RSpec matcher", :valid_value => true, :invalid_value => false do
    let(:matcher) { satisfy { |v| v } }
  end

  it "describes itself" 


  it "passes if block returns true" 


  context "when no custom description is provided" do
    context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
      it "fails with block snippet if block returns false" 


      context 'when used with an alias name' do
        alias_matcher :fulfill, :satisfy

        it 'can extract the block snippet' 

      end
    end

    context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
      it "fails without block snippet if block returns false" 

    end
  end

  context "when a custom description is provided" do
    it "describes itself" 


    it "passes if block returns true" 


    it "fails with the custom description if block returns false" 

  end
end

RSpec.describe "expect(...).not_to satisfy { block }" do
  it "passes if block returns false" 


  context "when no custom description is provided" do
    context 'in Ripper supported environment', :if => RSpec::Support::RubyFeatures.ripper_supported? do
      it "fails with block snippet if block returns true" 

    end

    context 'in Ripper unsupported environment', :unless => RSpec::Support::RubyFeatures.ripper_supported? do
      it "fails without block snippet if block returns true" 

    end
  end

  context "when a custom description is provided" do
    it "passes if block returns false" 


    it "fails with the custom description if block returns true" 

  end
end

