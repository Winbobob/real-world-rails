# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::ExtraSpacing, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'common behavior' do
    it 'registers an offense for alignment with token not preceded by space' 


    it 'accepts aligned values of an implicit hash literal' 


    it 'accepts space between key and value in a hash with hash rockets' 


    context 'when spaces are present in a single-line hash literal' do
      it 'registers an offense for hashes with symbol keys' 


      it 'registers an offense for hashes with hash rockets' 

    end

    it 'can handle extra space before a float' 


    it 'can handle unary plus in an argument list' 


    it 'gives the correct line' 


    it 'registers an offense for double extra spacing on variable assignment' 


    it 'ignores whitespace at the beginning of the line' 


    it 'ignores whitespace inside a string' 


    it 'ignores trailing whitespace' 


    it 'registers an offense on class inheritance' 


    it 'auto-corrects a line indented with mixed whitespace' 


    it 'auto-corrects the class inheritance' 

  end

  sources = {
    'lining up assignments' => <<-RUBY.strip_indent,
      website = "example.org"
      name    = "Jill"
    RUBY

    'lining up assignments with empty lines and comments in between' =>
    <<-RUBY.strip_indent,
      a   += 1

      # Comment
      aa   = 2
      bb   = 3

      a  ||= 1
    RUBY

    'aligning with the same character' => <<-RUBY.strip_margin('|'),
      |      y, m = (year * 12 + (mon - 1) + n).divmod(12)
      |      m,   = (m + 1)                    .divmod(1)
    RUBY

    'lining up different kinds of assignments' => <<-RUBY.strip_indent,
      type_name ||= value.class.name if value
      type_name   = type_name.to_s   if type_name

      type_name  = value.class.name if     value
      type_name += type_name.to_s   unless type_name

      a  += 1
      aa -= 2
    RUBY

    'aligning comments on non-adjacent lines' => <<-RUBY.strip_indent,
      include_examples 'aligned',   'var = until',  'test'

      include_examples 'unaligned', "var = if",     'test'
    RUBY

    'aligning = on lines where there are trailing comments' =>
    <<-RUBY.strip_indent,
      a_long_var_name = 100 # this is 100
      short_name1     = 2

      clear

      short_name2     = 2
      a_long_var_name = 100 # this is 100

      clear

      short_name3     = 2   # this is 2
      a_long_var_name = 100 # this is 100
    RUBY

    'aligning tokens with empty line between' => <<-RUBY.strip_indent,
      unless nochdir
        Dir.chdir "/"    # Release old working directory.
      end

      File.umask 0000    # Ensure sensible umask.
    RUBY

    'aligning long assignment expressions that include line breaks' =>
    <<-RUBY.strip_indent
      size_attribute_name    = FactoryGirl.create(:attribute,
                                                  name:   'Size',
                                                  values: %w{small large})
      carrier_attribute_name = FactoryGirl.create(:attribute,
                                                  name:   'Carrier',
                                                  values: %w{verizon})
    RUBY
  }.freeze

  context 'when AllowForAlignment is true' do
    let(:cop_config) do
      { 'AllowForAlignment' => true, 'ForceEqualSignAlignment' => false }
    end

    include_examples 'common behavior'

    context 'with extra spacing for alignment purposes' do
      sources.each do |reason, src|
        context "such as #{reason}" do
          it 'allows it' 

        end
      end
    end
  end

  context 'when AllowForAlignment is false' do
    let(:cop_config) do
      { 'AllowForAlignment' => false, 'ForceEqualSignAlignment' => false }
    end

    include_examples 'common behavior'

    context 'with extra spacing for alignment purposes' do
      sources.each do |reason, src|
        context "such as #{reason}" do
          it 'registers offense(s)' 

        end
      end
    end
  end

  context 'when ForceEqualSignAlignment is true' do
    let(:cop_config) do
      { 'AllowForAlignment' => true, 'ForceEqualSignAlignment' => true }
    end

    it 'registers an offense if consecutive assignments are not aligned' 


    it 'does not register an offense if assignments are separated by blanks' 


    it 'does not register an offense if assignments are aligned' 


    it 'aligns the first assignment with the following assignment' 


    it 'autocorrects consecutive assignments which are not aligned' 


    it 'autocorrects consecutive operator assignments which are not aligned' 


    it 'autocorrects consecutive aref assignments which are not aligned' 


    it 'autocorrects consecutive attribute assignments which are not aligned' 


    it 'does not register an offense when optarg equals is not aligned with ' \
       'assignment equals sign' do
      expect_no_offenses(<<-RUBY.strip_indent)
        def method(arg = 1)
          var = arg
        end
      RUBY
    end
  end
end

