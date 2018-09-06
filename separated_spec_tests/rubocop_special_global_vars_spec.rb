# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SpecialGlobalVars, :config do
  subject(:cop) { described_class.new(config) }

  context 'when style is use_english_names' do
    let(:cop_config) { { 'EnforcedStyle' => 'use_english_names' } }

    it 'registers an offense for $:' 


    it 'registers an offense for $"' 


    it 'registers an offense for $0' 


    it 'registers an offense for $$' 


    it 'is clear about variables from the English library vs those not' 


    it 'does not register an offense for backrefs like $1' 


    it 'auto-corrects $: to $LOAD_PATH' 


    it 'auto-corrects $/ to $INPUT_RECORD_SEPARATOR' 


    it 'auto-corrects #$: to #{$LOAD_PATH}' 


    it 'auto-corrects #{$!} to #{$ERROR_INFO}' 


    it 'generates correct auto-config when Perl variable names are used' 


    it 'generates correct auto-config when mixed styles are used' 

  end

  context 'when style is use_perl_names' do
    let(:cop_config) { { 'EnforcedStyle' => 'use_perl_names' } }

    it 'registers an offense for $LOAD_PATH' 


    it 'registers an offense for $LOADED_FEATURES' 


    it 'registers an offense for $PROGRAM_NAME' 


    it 'registers an offense for $PID' 


    it 'registers an offense for $PROCESS_ID' 


    it 'does not register an offense for backrefs like $1' 


    it 'auto-corrects $LOAD_PATH to $:' 


    it 'auto-corrects $INPUT_RECORD_SEPARATOR to $/' 


    it 'auto-corrects #{$LOAD_PATH} to #$:' 

  end
end

