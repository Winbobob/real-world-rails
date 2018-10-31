require 'spec_helper'

describe UUIDUtils do

  describe "#parse_raw and #raw" do

    # Using MySQL connection (the `raw_connection`) because I didn't find a way
    # to do prepared statements with just the `connection` object.
    # Prepared statement seems to be the way to store binary data.
    #
    let(:mysql_conn) { ActiveRecord::Base.connection.raw_connection }

    before(:each) do
      mysql_conn.prepare("
        CREATE TEMPORARY TABLE `uuid_utils_test` (
          `id` int(11) NOT NULL AUTO_INCREMENT,
          `uuid` binary(16) NOT NULL,
          PRIMARY KEY (`id`)
        )").execute
    end

    # Takes UUID and returns the time component
    # which is the first 18 (16 chars + 2 dashes) chars
    def time_component(uuid_string)
      uuid_string.to_s.first(18)
    end

    it "parses back and forth" 

  end
end

