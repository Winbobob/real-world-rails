require 'spec_helper'

describe JsRegexValidator do
  describe '#validates_each' do
    using RSpec::Parameterized::TableSyntax

    let(:validator) { described_class.new(attributes: [:user_default_internal_regex]) }
    let(:application_setting) { build(:application_setting, user_default_external: true) }

    where(:user_default_internal_regex, :result) do
      nil            | []
      ''             | []
      '(?#comment)'  | ['Regex Pattern (?#comment) can not be expressed in Javascript']
      '(?(a)b|c)'    | ['invalid conditional pattern: /(?(a)b|c)/i']
      '[a-z&&[^uo]]' | ["Dropped unsupported set intersection '[a-z&&[^uo]]' at index 0",
                        "Dropped unsupported nested negative set data '[^uo]' at index 6"]
    end

    with_them do
      it 'generates correct errors' 

    end
  end
end

