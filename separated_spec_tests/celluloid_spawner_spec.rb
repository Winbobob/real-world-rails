# set logger early on
require "celluloid/internals/logger"

if Celluloid.group_class == Celluloid::Group::Spawner
  RSpec.describe Celluloid::Group::Spawner do
    it_behaves_like "a Celluloid Group"

    it "does not leak finished threads" 

  end
end

