require 'spec_helper'
require 'nokogiri'

module Gitlab
  describe Asciidoc do
    let(:input) { '<b>ascii</b>' }
    let(:context) { {} }
    let(:html) { 'H<sub>2</sub>O' }

    context "without project" do
      before do
        allow_any_instance_of(ApplicationSetting).to receive(:current).and_return(::ApplicationSetting.create_from_defaults)
      end

      it "converts the input using Asciidoctor and default options" 


      context "with asciidoc_opts" do
        it "merges the options with default ones" 

      end

      context "XSS" do
        links = {
          'links' => {
            input: 'link:mylink"onmouseover="alert(1)[Click Here]',
            output: "<div>\n<p><a href=\"mylink\">Click Here</a></p>\n</div>"
          },
          'images' => {
            input: 'image:https://localhost.com/image.png[Alt text" onerror="alert(7)]',
            output: "<div>\n<p><span><img src=\"https://localhost.com/image.png\" alt='Alt text\" onerror=\"alert(7)'></span></p>\n</div>"
          },
          'pre' => {
            input: '```mypre"><script>alert(3)</script>',
            output: "<div>\n<div>\n<pre lang=\"mypre\">\"&gt;<code></code></pre>\n</div>\n</div>"
          }
        }

        links.each do |name, data|
          it "does not convert dangerous #{name} into HTML" 

        end
      end

      context 'external links' do
        it 'adds the `rel` attribute to the link' 

      end

      context 'LaTex code' do
        it 'adds class js-render-math to the output' 

      end

      context 'outfilesuffix' do
        it 'defaults to adoc' 

      end
    end

    def render(*args)
      described_class.render(*args)
    end
  end
end

