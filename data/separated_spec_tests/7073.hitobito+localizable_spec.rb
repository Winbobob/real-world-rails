# encoding: utf-8

#  Copyright (c) 2012-2014, Jungwacht Blauring Schweiz. This file is part of
#  hitobito and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito.

require 'spec_helper'

describe Concerns::Localizable do

  controller(ApplicationController) do
    def index; end
  end

  before do
    @cached_locales = I18n.available_locales
    @cached_languages = Settings.application.languages
    Settings.application.languages = { de: 'Deutsch', fr: 'Français' }
    I18n.available_locales = Settings.application.languages.keys
  end

  after do
    I18n.available_locales = @cached_locales
    Settings.application.languages = @cached_languages
    I18n.locale = I18n.default_locale
  end

  it 'uses locale from params if given' 


  it 'uses locale from cookie if param empty' 


  it 'uses locale from cookie if param invalid' 


  it 'uses default locale if nothing else found' 

end

