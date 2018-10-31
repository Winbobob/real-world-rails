# frozen_string_literal: true

RSpec.describe "bundle install" do
  context "installing a gem fails" do
    it "prints out why that gem was being installed" 

      activesupport
                     M
    end

    it "prints out the hint for the remote source when available" 

      activesupport
                     M
    end

    context "because the downloaded .gem was invalid" do
      before do
        build_repo4 do
          build_gem "a"
        end

        gem_repo4("gems", "a-1.0.gem").open("w") {|f| f << "<html></html>" }
      end

      it "removes the downloaded .gem" 

    end
  end
end

