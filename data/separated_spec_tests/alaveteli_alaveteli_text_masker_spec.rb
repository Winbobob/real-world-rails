# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AlaveteliTextMasker do

  let(:class_instance) { Class.new { include AlaveteliTextMasker }.new }

  describe '#apply_masks' do

    context 'applying censor rules' do

      before do
        @cheese_censor_rule = FactoryGirl.build(:censor_rule,
                                                :text => 'Stilton',
                                                :replacement => 'Jarlsberg')
        @colour_censor_rule = FactoryGirl.build(:censor_rule,
                                                :text => 'blue',
                                                :replacement => 'yellow')
        @regex_censor_rule = FactoryGirl.build(:censor_rule,
                                               :text => 'm[a-z][a-z][a-z]e',
                                               :replacement => 'cat',
                                               :regexp => true)
        @censor_rules = [@cheese_censor_rule,
                         @colour_censor_rule,
                         @regex_censor_rule]
      end

      it "does nothing to a JPEG" 


      it "replaces censor text in Word documents" 


      it 'handles multibyte characters in binary file types as binary data' 


      it "applies censor rules to HTML files" 


    end

    context 'applying masks to binary' do

      it "replaces ASCII email addresses in Word documents" 



      it "replaces UCS-2 addresses in Word documents" 


    end

    context 'applying masks to PDF' do

      def pdf_replacement_test(use_ghostscript_compression)
        config = MySociety::Config.load_default
        previous = config['USE_GHOSTSCRIPT_COMPRESSION']
        config['USE_GHOSTSCRIPT_COMPRESSION'] = use_ghostscript_compression
        orig_pdf = load_file_fixture('tfl.pdf')
        pdf = orig_pdf.dup

        orig_text = MailHandler.get_attachment_text_one_file('application/pdf', pdf)
        expect(orig_text).to match(/foi@tfl.gov.uk/)

        result = class_instance.apply_masks(pdf, "application/pdf")

        masked_text = MailHandler.get_attachment_text_one_file('application/pdf', result)
        expect(masked_text).not_to match(/foi@tfl.gov.uk/)
        expect(masked_text).to match(/xxx@xxx.xxx.xx/)
        config['USE_GHOSTSCRIPT_COMPRESSION'] = previous
      end

      it "replaces everything in PDF files using pdftk" 


      it "replaces everything in PDF files using ghostscript" 


      it "does not produce zero length output if pdftk silently fails" 


      it 'returns the uncensored original if there is nothing to censor' 


      it 'keeps the uncensored original if uncompression of a PDF fails' 


      it 'uses the uncompressed PDF text if re-compression of a compressed PDF fails' 


    end

    context 'applying masks to text' do

      it "applies hard-coded privacy rules to HTML files" 


      it 'replaces a simple email address' 


      it 'replaces a mobile phone number prefixed with "Mobile"' 


      it 'replaces a mobile phone number prefixed with "Mob Tel"' 


      it 'replaces a mobile phone number prefixed with "Mob/Fax:"' 


      it "replaces an Alaveteli login link" 


      it "replaces a https Alaveteli login link" 


      it "applies censor rules to text" 


      it 'applies extra masks to text' 


    end

  end

end

