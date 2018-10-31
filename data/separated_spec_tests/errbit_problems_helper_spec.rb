describe ProblemsHelper do
  describe "#gravatar_tag" do
    let(:email) { "gravatar@example.com" }
    let(:email_hash) { Digest::MD5.hexdigest email }
    let(:base_url) { "http://www.gravatar.com/avatar/#{email_hash}" }

    context "default config" do
      before do
        allow(Errbit::Config).to receive(:use_gravatar).and_return(true)
        allow(Errbit::Config).to receive(:gravatar_default).and_return('identicon')
      end

      it "should render image_tag with correct alt and src" 


      it "should override :d" 

    end

    context "no email" do
      it "should not render the tag" 

    end
  end

  describe "#gravatar_url" do
    context "no email" do
      let(:email) { nil }

      it "should return nil" 

    end

    context "without ssl" do
      let(:email) { "gravatar@example.com" }
      let(:email_hash) { Digest::MD5.hexdigest email }

      it "should return the http url" 

    end

    context "with ssl" do
      let(:email) { "gravatar@example.com" }
      let(:email_hash) { Digest::MD5.hexdigest email }

      it "should return the http url" 

    end
  end
end

