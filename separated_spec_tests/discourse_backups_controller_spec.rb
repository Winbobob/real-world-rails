require "rails_helper"

describe Admin::BackupsController do

  it "is a subclass of AdminController" 


  let(:backup_filename) { "2014-02-10-065935.tar.gz" }

  context "while logged in as an admin" do

    before { @admin = log_in(:admin) }

    describe ".index" do

      context "html format" do

        it "preloads important data" 


      end

      context "json format" do

        it "returns a list of all the backups" 


      end

    end

    describe ".status" do

      it "returns the current backups status" 


    end

    describe ".create" do

      it "starts a backup" 


    end

    describe ".show" do

      it "uses send_file to transmit the backup" 


      it "returns 422 when token is bad" 


      it "returns 404 when the backup does not exist" 


    end

    describe ".destroy" do

      let(:b) { Backup.new(backup_filename) }

      it "removes the backup if found" 


      it "doesn't remove the backup if not found" 


    end

    describe ".logs" do

      it "preloads important data" 

    end

    describe ".restore" do

      it "starts a restore" 


    end

    describe ".readonly" do

      it "enables readonly mode" 


      it "disables readonly mode" 


    end

    describe "#upload_backup_chunk" do
      describe "when filename contains invalid characters" do
        it "should raise an error" 

      end

      describe "when filename is valid" do
        it "should upload the file successfully" 

      end
    end

  end

end

