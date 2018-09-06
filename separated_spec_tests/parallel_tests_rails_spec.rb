require 'spec_helper'

describe 'rails' do
  let(:test_timeout) { 300 } # this can take very long on fresh bundle ...

  def sh(command, options={})
    result = ''
    IO.popen(options.fetch(:environment, {}), command) do |io|
      result = io.read
    end
    raise "FAILED #{command}\n#{result}" if $?.success? == !!options[:fail]
    result
  end

  %w(rails32 rails42 rails50).each do |rails|
    it "can create and run #{rails}" 

  end
end

