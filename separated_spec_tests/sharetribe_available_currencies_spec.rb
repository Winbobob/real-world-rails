require 'spec_helper'

describe TransactionService::AvailableCurrencies do
  context '#paypal_allows_country_and_currency?' do
    it 'works for all countries with valid currency' 


    def paypal(country, currency)
      TransactionService::AvailableCurrencies.paypal_allows_country_and_currency?(country, currency)
    end
  end

  context '#stripe_allows_country_and_currency?' do
    it 'works for listed countries' 


    def stripe(country, currency)
      TransactionService::AvailableCurrencies.stripe_allows_country_and_currency?(country, currency, :destination)
    end
  end
end

