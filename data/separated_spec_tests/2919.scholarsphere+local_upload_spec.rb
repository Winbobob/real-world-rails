# frozen_string_literal: true

require_relative '../benchmark_helper.rb'

RSpec.shared_examples 'uploading locally' do
  it 'logs in and uploads files' 

end

RSpec.describe 'Benchmark tests: Local upload' do
  let(:browser) { driver }

  it_behaves_like 'uploading locally'
end

