require "minitest/autorun"
require "fog"
require "fog/bin"
require "helpers/bin"

describe Serverlove do
  include Fog::BinSpec

  let(:subject) { Serverlove }
end

