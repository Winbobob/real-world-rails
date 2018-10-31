# frozen_string_literal: true

RSpec.describe 'isolated environment', :isolated_environment, type: :feature do
  include_context 'cli spec behavior'

  let(:cli) { RuboCop::CLI.new }

  # Configuration files above the work directory shall not disturb the
  # tests. This is especially important on Windows where the temporary
  # directory is under the user's home directory. On any platform we don't want
  # a .rubocop.yml file in the temporary directory to affect the outcome of
  # rspec.
  it 'is not affected by a config file above the work directory' 

end

