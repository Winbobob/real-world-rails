require "rails_helper"
require "uri"

base_uri = "https://glitch.com/embed/#!/embed/"

RSpec.describe GlitchTag, type: :liquid_template do
  describe "#id" do
    let(:valid_id) { "BXgGcAUjM39" }
    let(:id_with_quotes) { 'some-id" onload="alert(42)"' }
    let(:id_with_app_option) { "some-id app" }
    let(:id_with_code_option) { "some-id code" }
    let(:id_with_no_files_option) { "some-id no-files" }
    let(:id_with_no_attribution_option) { "some-id no-attribution" }
    let(:id_with_preview_first_option) { "some-id preview-first" }
    let(:id_with_file_option) { "some-id file=script.js" }
    let(:id_with_app_and_code_option) { "some-id app code" }
    let(:id_with_many_options) { "some-id app no-attribution no-files file=script.js" }

    def generate_tag(id)
      Liquid::Template.register_tag("glitch", GlitchTag)
      Liquid::Template.parse("{% glitch #{id} %}")
    end

    it "accepts a valid id" 


    it "does not accept double quotes" 


    it "handles 'app' option" 


    it "handles 'code' option" 


    it "handles 'no-files' option" 


    it "handles 'preview-first' option" 


    it "handles 'no-attribution' option" 


    it "handles 'file' option" 


    it "handles complex case" 


    it "'app' and 'code' cancel each other" 

  end
end

