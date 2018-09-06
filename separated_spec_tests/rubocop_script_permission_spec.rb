# frozen_string_literal: true

# rubocop:disable Style/NumericLiteralPrefix
RSpec.describe RuboCop::Cop::Lint::ScriptPermission do
  subject(:cop) { described_class.new(config, options) }

  let(:config) { RuboCop::Config.new }
  let(:options) { nil }

  let(:file) { Tempfile.new('') }
  let(:filename) { file.path.split('/').last }
  # HACK: extra empty line to bypass Parser 2.5.0.2 issue:
  let(:source) { "#!/usr/bin/ruby\n\n" }

  after do
    file.close
    file.unlink
  end

  context 'with file permission 0644' do
    before do
      File.write(file.path, source)
      FileUtils.chmod(0644, file.path)
    end

    if RuboCop::Platform.windows?
      context 'Windows' do
        it 'allows any file permissions' 

      end
    else
      it 'registers an offense for script permission' 

    end
  end

  context 'with file permission 0755' do
    before do
      FileUtils.chmod(0755, file.path)
    end

    it 'accepts with shebang line' 


    it 'accepts without shebang line' 


    it 'accepts with blank' 

  end

  context 'with stdin' do
    let(:options) { { stdin: '' } }

    it 'skips investigation' 

  end

  unless RuboCop::Platform.windows?
    context 'auto-correct' do
      it 'adds execute permissions to the file' 

    end
  end
end
# rubocop:enable Style/NumericLiteralPrefix

