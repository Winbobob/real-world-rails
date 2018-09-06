describe Qiita::Markdown::Filters::Greenmat do
  subject(:filter) do
    described_class.new(markdown)
  end

  context "with headings" do
    let(:markdown) do
      "# foo"
    end

    it "does not generate FontAwesome classes so that we can say that they're inputted by user" 

  end
end

