require 'spec_helper'

module Addons
  describe PdfExportTask do
    before :each do
      PdfExportTask.stub :enabled? => true
      @task = PdfExportTask.new
    end

    it 'should be an ExportTask addon' 


    it 'should have proper id' 


    it 'should delegate to ExportGenerator' 


    it 'should generate filename for one child' 


    it 'should generate filename for multiple children' 

  end
end

