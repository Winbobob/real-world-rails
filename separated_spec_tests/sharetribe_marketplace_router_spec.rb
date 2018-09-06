require 'active_support/core_ext/object'
require 'possibly' # Maybe

[
  "app/utils/entity_utils",
  "app/utils/hash_utils",
  "app/utils/url_utils",
  "app/utils/marketplace_router",
].each { |f| require_relative "../../#{f}" }

describe MarketplaceRouter do

  def expect_target(reason:, request: {}, community: {}, paths: {}, other: {}, configs: {})
    default_request = {
      host: "marketplace.sharetribe.com",
      protocol: "https://",
      fullpath: "/listings",
      port_string: "",
      headers: {}
    }
    default_community = {
      use_domain: true,
      deleted: false,
      closed: false,
      domain: "www.marketplace.com",
      ident: "marketplace",
    }
    default_paths = {
      community_not_found: {route_name: :not_found},
      new_community: {route_name: :new_community},
    }
    default_configs = {
      app_domain: "sharetribe.com"
    }

    target = MarketplaceRouter.redirect_target(
      reason: reason,
      request: default_request.merge(request),
      community: community.nil? ? nil : default_community.merge(community),
      paths: default_paths.merge(paths),
      configs: default_configs.merge(configs)
    )

    expect(target)
  end

  describe "#redirect_target" do

    it "redirects to full domain, if marketplace is accessed with the subdomain (ident) and full domain is provided and use_domain is true" 


    it "includes port" 


    it "redirects deleted marketplaces" 


    it "redirects closed marketplaces" 


    it "adds utm_ parameters when redirecting deleted" 


    it "adds utm_ parameters when redirecting closed" 


    it "redirects to community not found if community was not found and some communities do exist" 


    it "adds utm_ parameters when redirecting no community found and other communties exist" 


    it "redirects to new community page if community was not found and no communities exist" 


    it "redirects to marketplace ident without www" 


    it "redirects to marketplace domain if available" 


    it "redirects back to ident if domain is not in use" 

  end

  describe "#redirect_reason" do

    def expect_reason(opts = {})
      defaults = {
        community: {
          use_domain: true,
          deleted: false,
          closed: false,
          domain: "www.marketplace.com",
          ident: "marketplace",
        },
        host: "marketplace.sharetribe.com",
        no_communities: false,
        app_domain: "sharetribe.com",
      }

      reason = MarketplaceRouter.redirect_reason(defaults.deep_merge(opts))
      expect(reason)
    end

    it "does not redirect to full domain if the host is already the full domain" 


    it "does not redirect to full domain if full domain is not provided" 


    it "redirects to full domain, if marketplace is accessed with the subdomain (ident) and full domain is provided and use_domain is true" 


    it "does not redirect if use_domain is false" 


    it "redirects deleted marketplaces" 


    it "redirects closed marketplaces" 


    it "redirects to community not found if community was not found and some communities do exist" 


    it "redirects to new community page if community was not found and no communities exist" 


    it "redirects to marketplace ident without www" 


    it "redirects to marketplace domain if available" 


    it "redirects back to ident if domain is not in use" 

  end
end

