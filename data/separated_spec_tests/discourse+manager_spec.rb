require 'rails_helper'
require 'stylesheet/compiler'

describe Stylesheet::Manager do

  it 'does not crash for missing theme' 


  it 'can correctly compile theme css' 


  describe 'digest' do
    after do
      DiscoursePluginRegistry.stylesheets.delete "fake_file"
    end

    it 'can correctly account for plugins in digest' 


    it "can correctly account for settings in theme's components" 


    let(:image) { file_from_fixtures("logo.png") }
    let(:image2) { file_from_fixtures("logo-dev.png") }

    it 'can correctly account for theme uploads in digest' 

  end

  describe 'color_scheme_digest' do
    it "changes with category background image" 

  end

  # this test takes too long, we don't run it by default
  describe ".precompile_css", if: ENV["RUN_LONG_TESTS"] == "1" do
    before do
      class << STDERR
        alias_method :orig_write, :write
        def write(x)
        end
      end
    end

    after do
      class << STDERR
        def write(x)
          orig_write(x)
        end
      end
      FileUtils.rm_rf("tmp/stylesheet-cache")
    end

    it "correctly generates precompiled CSS" 

  end
end

