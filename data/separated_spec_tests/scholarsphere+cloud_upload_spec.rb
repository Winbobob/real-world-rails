# frozen_string_literal: true

require_relative '../benchmark_helper.rb'

RSpec.shared_examples 'uploading from Box' do
  it 'logs in and uploads files from my Box account' 

end

RSpec.describe 'Benchmark tests: Cloud upload' do
  let(:browser) { driver }

  it_behaves_like 'uploading from Box'
end

