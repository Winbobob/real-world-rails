# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::FormatStringToken, :config do
  subject(:cop) { described_class.new(config) }

  let(:enforced_style) { :annotated }

  let(:cop_config) do
    {
      'EnforcedStyle' => enforced_style,
      'SupportedStyles' => %i[annotated template unannotated]
    }
  end

  shared_examples 'format string token style' do |name, good, bad|
    bad_style1 = bad

    context "when enforced style is #{name}" do
      let(:enforced_style) { name }

      it "registers offenses for #{bad_style1}" 


      it 'supports dynamic string with interpolation' 


      it 'sets the enforced style to annotated after inspecting "%<a>s"' 


      it 'configures the enforced style to template after inspecting "%{a}"' 

    end
  end

  shared_examples 'enforced styles for format string tokens' do |token|
    template  = '%{template}'
    annotated = "%<named>#{token}"

    include_examples 'format string token style',
                     :annotated,
                     annotated,
                     template

    include_examples 'format string token style',
                     :template,
                     template,
                     annotated
  end

  shared_examples 'offense message' do |enforced_style, source, message|
    context "when enforced style is #{enforced_style}" do
      let(:enforced_style) { enforced_style }

      it 'gives a helpful error message' 

    end
  end

  it 'ignores xstr' 


  it 'ignores regexp' 


  it 'ignores `%r` regexp' 


  %i[strptime strftime].each do |method_name|
    it "ignores time format (when used as argument to #{method_name})" 

  end

  it 'ignores time format when it is stored in a variable' 


  it 'ignores time format and unrelated `format` method using' 


  it 'handles dstrs' 


  it 'ignores http links' 


  it 'ignores placeholder argumetns' 


  it 'handles __FILE__' 


  it_behaves_like 'enforced styles for format string tokens', 'A'
  it_behaves_like 'enforced styles for format string tokens', 'B'
  it_behaves_like 'enforced styles for format string tokens', 'E'
  it_behaves_like 'enforced styles for format string tokens', 'G'
  it_behaves_like 'enforced styles for format string tokens', 'X'
  it_behaves_like 'enforced styles for format string tokens', 'a'
  it_behaves_like 'enforced styles for format string tokens', 'b'
  it_behaves_like 'enforced styles for format string tokens', 'c'
  it_behaves_like 'enforced styles for format string tokens', 'd'
  it_behaves_like 'enforced styles for format string tokens', 'e'
  it_behaves_like 'enforced styles for format string tokens', 'f'
  it_behaves_like 'enforced styles for format string tokens', 'g'
  it_behaves_like 'enforced styles for format string tokens', 'i'
  it_behaves_like 'enforced styles for format string tokens', 'o'
  it_behaves_like 'enforced styles for format string tokens', 'p'
  it_behaves_like 'enforced styles for format string tokens', 's'
  it_behaves_like 'enforced styles for format string tokens', 'u'
  it_behaves_like 'enforced styles for format string tokens', 'x'

  include_examples(
    'offense message',
    :annotated,
    '"%{foo}"',
    'Prefer annotated tokens (like `%<foo>s`) ' \
    'over template tokens (like `%{foo}`).'
  )

  include_examples(
    'offense message',
    :template,
    '"%<foo>d"',
    'Prefer template tokens (like `%{foo}`) ' \
    'over annotated tokens (like `%<foo>s`).'
  )

  include_examples(
    'offense message',
    :unannotated,
    '"%{foo}"',
    'Prefer unannotated tokens (like `%s`) ' \
    'over template tokens (like `%{foo}`).'
  )
end

