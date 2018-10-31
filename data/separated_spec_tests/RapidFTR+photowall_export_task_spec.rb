require 'spec_helper'

module Addons
  describe PhotowallExportTask do
    before :each do
      PhotowallExportTask.stub :enabled? => true
      @task = PhotowallExportTask.new
    end

    it 'should be an ExportTask addon' 


    it 'should have proper id' 


    it 'should delegate to ExportGenerator' 


    it 'should generate filename for one child' 


    it 'should generate filename for multiple children' 

  end
end

