require 'spec_helper'

describe Storytime::Importers::Wordpress do
  let(:file){ File.open("./spec/support/files/wordpress_export.xml") }
  let(:user){ FactoryGirl.create(:user) }
  let(:importer){ Storytime::Importers::Wordpress.new file, user }

  describe "#import!" do
    it "imports" 

  end
end

