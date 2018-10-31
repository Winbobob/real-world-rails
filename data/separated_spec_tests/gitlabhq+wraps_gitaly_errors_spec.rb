require 'spec_helper'

describe Gitlab::Git::WrapsGitalyErrors do
  subject(:wrapper) do
    klazz = Class.new { include Gitlab::Git::WrapsGitalyErrors }
    klazz.new
  end

  describe "#wrapped_gitaly_errors" do
    mapping = {
      GRPC::NotFound => Gitlab::Git::Repository::NoRepository,
      GRPC::InvalidArgument => ArgumentError,
      GRPC::BadStatus => Gitlab::Git::CommandError
    }

    mapping.each do |grpc_error, error|
      it "wraps #{grpc_error} in a #{error}" 

    end

    it 'does not swallow other errors' 

  end
end

