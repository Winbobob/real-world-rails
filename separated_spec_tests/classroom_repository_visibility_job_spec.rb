# frozen_string_literal: true

require "rails_helper"

# This exception initializer crashes if it isn't thrown from the serializer...
# so let's override it.
module ActiveJob
  class DeserializationError
    def initialize; end
  end
end

RSpec.describe Assignment::RepositoryVisibilityJob, type: :job do
  subject { Assignment::RepositoryVisibilityJob }

  context "when a serialization error is thrown" do
    it "does not crash the test" 

  end

  context "when a different error is thrown" do
    it "crashes the test" 

  end
end

