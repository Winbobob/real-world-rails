require "minitest/autorun"
require "fog"
require "fog/bin"
require "helpers/bin"

describe Glesys do
  include Fog::BinSpec

  let(:subject) { Glesys }
end
