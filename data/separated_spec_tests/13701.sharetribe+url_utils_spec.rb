require 'active_support/core_ext/object'
[
  "app/utils/url_utils",
  "app/utils/hash_utils",
].each { |f| require_relative "../../#{f}" }

describe URLUtils do
  it "#append_query_param" 


  it "#remove_query_param" 


  it "#extract_locale_from_url" 


  it "#strip_port_from_host" 


  it "#build_url" 


  describe "#join" do

    def expect_url_join(*parts)
      expect(URLUtils.join(*parts))
    end

    it "joins absolute paths" 


    it "joins relative paths" 

  end

  describe "asset_host?" do
    it "returns true if host and asset host are equal" 


    it "allows %d wildcards" 


  end
end

