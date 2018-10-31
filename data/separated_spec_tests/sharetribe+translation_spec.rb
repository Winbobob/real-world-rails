require "spec_helper"
describe TranslationService::API::Translations do

  TranslationsAPI = TranslationService::API::Api.translations

  before(:each) do
    @community_id = 88 # cucumber loads test data for existing test communities
    @translation_key1 = "027268a5-abbf-4191-b6bd-b1e7569b361f"
    @translation_key2 = "blaa-blaa-blaa"
    @locale_en = "en"
    @translation_en = "aa en"
    @locale_fi = "fi-FI"
    @translation_fi = "aa fi"
    @locale_sv = "sv-SE"
    @translations1 =
      [ { locale: @locale_en,
          translation: @translation_en
        },
        { locale: @locale_fi,
          translation: @translation_fi
        }
      ]
    @translations_with_keys =
      @translations1.map { |translation|
        {translation_key: @translation_key1}.merge(translation)
      }
    @translations_groups =
      [ { translation_key: @translation_key1,
          translations: @translations1
        }
      ]
    @translation_groups_with_keys =
      [ { translation_key: @translation_key1,
          translations: @translations_with_keys
        }
      ]
    @creation_hash =
      { community_id: @community_id,
        translation_groups: @translations_groups
      }

  end


  it "POST request with only community_id" 


  it "POST request with community_id and wrong params" 


  it "POST request with community_id and wrong structure in params" 


  it "POST request with community_id and correct params" 



  it "GET request with only community_id" 


  it "GET request with community_id and translation_keys" 


  it "GET request with community_id and locales" 


  it "GET request with community_id, locales, and fallback_locale" 



  it "GET request with only community_id, translation_keys and locales" 


  it "GET request with only community_id, translation_keys, locales, and fallback_locale" 


  it "GET request with only community_id, and wrong params" 



  it "DELETE request with only community_id" 


  it "DELETE request with only community_id with wrong params" 


  it "DELETE request with only community_id with correct params" 



end

