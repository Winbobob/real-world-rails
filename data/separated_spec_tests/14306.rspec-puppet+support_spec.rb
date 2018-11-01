require 'spec_helper'
require 'rspec-puppet/adapters'

describe RSpec::Puppet::Support do
  subject do
    Object.new.extend(RSpec::Puppet::Support)
  end

  describe '#setup_puppet' do
    before do
      adapter = RSpec::Puppet::Adapters.get
      adapter.setup_puppet(subject)
      subject.adapter = adapter
    end

    it 'updates the ruby $LOAD_PATH based on the current modulepath' 

  end

  describe "#ref" do
    it 'should return a new RawString with the type/title format' 

  end

  describe '#str_from_value' do
    it "should quote strings" 

    it "should not quote numbers" 

    it "should use literal 'default' when receiving :default" 

    it "should use literal 'undef' when receiving :undef" 

    it "should convert Symbols to Strings" 

    it "should handle Arrays recursively" 

    it "should handle Hashes recursively" 

  end

  describe '#find_pretend_platform' do
    let(:build_hash) do
      {
	"hostname" => "fy73bdiqazmyj62",
	"networking" => {
	  "hostname" => "fy73bdiqazmyj62",
	  "fqdn" => "fy73bdiqazmyj62.delivery.puppetlabs.net"
	},
      }
    end
    context 'without os facts' do
      it 'returns the correct platform' 

    end
    { 'windows' => :windows, 'debian' => :posix }.each do |family, platform|
      context 'with os structured fact' do
	let(:build_hash) do
	  super().merge({
	    "os" => {
	      "family" => family,
	      "version" => {
		"major" => "10"
	      }
	    }
	  })
	end
	it 'returns the correct platform' 

	end
      end
      context 'with osfamily fact' do
	let(:build_hash) do
	  super().merge({
	    "osfamily" => family
	  })
	end
	it 'returns the correct platform' 

	end
      end
    end
  end

  describe '#build_code' do
    before do
      class << subject
        def class_name
          "class_name"
        end
        def site_pp_str
          ""
        end
        def import_str
          ""
        end
      end
    end

    context "without any properties" do
      it "builds a test manifest" 

    end

    context "with a pre_condition available" do
      before do
        class << subject
          def pre_condition
            "pre_condition"
          end
        end
      end

      it "builds a test manifest" 

    end

    context "with a post_condition available" do
      before do
        class << subject
          def post_condition
            "post_condition"
          end
        end
      end

      it "builds a test manifest" 

    end
  end
end

