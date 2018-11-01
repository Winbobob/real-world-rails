# frozen_string_literal: true

RSpec.describe "bundle install with a lockfile present" do
  let(:gf) { <<-G }
    source "file://#{gem_repo1}"

    gem "rack", "1.0.0"
  G

  subject do
    install_gemfile(gf)
  end

  context "gemfile evaluation" do
    let(:gf) { super() + "\n\n File.open('evals', 'a') {|f| f << %(1\n) } unless ENV['BUNDLER_SPEC_NO_APPEND']" }

    context "with plugins disabled" do
      before do
        bundle! "config plugins false"
        subject
      end

      it "does not evaluate the gemfile twice" 


      context "when the gem is not installed" do
        before { FileUtils.rm_rf ".bundle" }

        it "does not evaluate the gemfile twice" 

      end
    end
  end
end

