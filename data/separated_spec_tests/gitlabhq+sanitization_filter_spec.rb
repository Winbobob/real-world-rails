require 'spec_helper'

describe Banzai::Filter::SanitizationFilter do
  include FilterSpecHelper

  describe 'default whitelist' do
    it 'sanitizes tags that are not whitelisted' 


    it 'sanitizes tag attributes' 


    it 'sanitizes javascript in attributes' 


    it 'sanitizes mixed-cased javascript in attributes' 


    it 'allows whitelisted HTML tags from the user' 


    it 'sanitizes `class` attribute on any element' 


    it 'sanitizes `id` attribute on any element' 

  end

  describe 'custom whitelist' do
    it 'customizes the whitelist only once' 


    it 'customizes the whitelist only once for different instances' 


    it 'sanitizes `class` attribute from all elements' 


    it 'sanitizes `class` attribute from non-highlight spans' 


    it 'allows `text-align` property in `style` attribute on table elements' 


    it 'disallows other properties in `style` attribute on table elements' 


    it 'disallows `text-align` property in `style` attribute on other elements' 


    it 'allows `span` elements' 


    it 'allows `abbr` elements' 


    it 'disallows the `name` attribute globally, allows on `a`' 


    it 'allows `summary` elements' 


    it 'allows `details` elements' 


    it 'allows `data-math-style` attribute on `code` and `pre` elements' 


    it 'removes `rel` attribute from `a` elements' 


    # Adapted from the Sanitize test suite: http://git.io/vczrM
    protocols = {
      'protocol-based JS injection: simple, no spaces' => {
        input:  '<a href="javascript:alert(\'XSS\');">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: simple, spaces before' => {
        input:  '<a href="javascript    :alert(\'XSS\');">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: simple, spaces after' => {
        input:  '<a href="javascript:    alert(\'XSS\');">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: simple, spaces before and after' => {
        input:  '<a href="javascript    :   alert(\'XSS\');">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: preceding colon' => {
        input:  '<a href=":javascript:alert(\'XSS\');">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: UTF-8 encoding' => {
        input:  '<a href="javascript&#58;">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: long UTF-8 encoding' => {
        input:  '<a href="javascript&#0058;">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: long UTF-8 encoding without semicolons' => {
        input:  '<a href=&#0000106&#0000097&#0000118&#0000097&#0000115&#0000099&#0000114&#0000105&#0000112&#0000116&#0000058&#0000097&#0000108&#0000101&#0000114&#0000116&#0000040&#0000039&#0000088&#0000083&#0000083&#0000039&#0000041>foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: hex encoding' => {
        input:  '<a href="javascript&#x3A;">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: long hex encoding' => {
        input:  '<a href="javascript&#x003A;">foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: hex encoding without semicolons' => {
        input:  '<a href=&#x6A&#x61&#x76&#x61&#x73&#x63&#x72&#x69&#x70&#x74&#x3A&#x61&#x6C&#x65&#x72&#x74&#x28&#x27&#x58&#x53&#x53&#x27&#x29>foo</a>',
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: null char' => {
        input:  "<a href=java\0script:alert(\"XSS\")>foo</a>",
        output: '<a href="java"></a>'
      },

      'protocol-based JS injection: invalid URL char' => {
        input: '<img src=java\script:alert("XSS")>',
        output: '<img>'
      },

      'protocol-based JS injection: Unicode' => {
        input: %Q(<a href="\u0001java\u0003script:alert('XSS')">foo</a>),
        output: '<a>foo</a>'
      },

      'protocol-based JS injection: spaces and entities' => {
        input:  '<a href=" &#14;  javascript:alert(\'XSS\');">foo</a>',
        output: '<a href>foo</a>'
      },

      'protocol whitespace' => {
        input: '<a href=" http://example.com/"></a>',
        output: '<a href="http://example.com/"></a>'
      }
    }

    protocols.each do |name, data|
      it "disallows #{name}" 

    end

    it 'disallows data links' 


    it 'disallows vbscript links' 


    it 'disallows invalid URIs' 


    it 'allows non-standard anchor schemes' 


    it 'allows relative links' 

  end
end

