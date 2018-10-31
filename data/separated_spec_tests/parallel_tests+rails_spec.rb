require 'spec_helper'

describe 'rails' do
  let(:test_timeout) { 420 } # this can take very long on fresh bundle ...

  def sh(command, options={})
    result = ''
    IO.popen(options.fetch(:environment, {}), command, err: [:child, :out]) do |io|
      result = io.read
    end
    raise "FAILED #{command}\n#{result}" if $?.success? == !!options[:fail]
    result
  end

  %w(rails51 rails52).each do |rails|
    it "can create and run #{rails}" 

  end
end

