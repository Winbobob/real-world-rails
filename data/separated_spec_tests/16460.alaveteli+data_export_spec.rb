# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + "./../../lib/data_export.rb")

describe DataExport do

  describe ".exportable_requests" do

    let(:cut_off) { Date.today + 1 }

    it "includes eligible requests " 


    it "does not include hidden requests" 


    it "does not include requests created after the cut_off date" 


    it "does not include embargoed requests" 


  end

  describe ".exportable_incoming_messages" do

    let(:cut_off) { Date.today + 1 }

    it "includes eligible messages" 


    it "does not include hidden messages" 


    it "does not include messages created after the cut_off date" 


    it "does not include messages belonging to hidden requests" 


    it "does not include messages belonging to embargoed requests" 


  end

  describe ".exportable_outgoing_messages" do

    let(:cut_off) { Date.today + 1 }

    it "includes eligible messages" 


    it "does not include hidden messages" 


    it "does not include messages created after the cut_off date" 


    it "does not include messages belonging to hidden requests" 


    it "does not include messages belonging to embargoed requests" 


  end

  describe ".exportable_foi_attachments" do

    let(:cut_off) { Date.today + 1 }

    it "includes eligible attachments" 


    it "does not include attachments of hidden messages" 


    it "does not include attachments of messages created after the cut_off" 


    it "does not include attachments of messages belonging to hidden requests" 


    it "does not include attachments related to embargoed requests" 


  end

end

