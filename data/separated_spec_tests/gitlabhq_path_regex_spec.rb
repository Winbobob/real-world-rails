# coding: utf-8
require 'spec_helper'

describe Gitlab::PathRegex do
  # Pass in a full path to remove the format segment:
  # `/ci/lint(.:format)` -> `/ci/lint`
  def without_format(path)
    path.split('(', 2)[0]
  end

  # Pass in a full path and get the last segment before a wildcard
  # That's not a parameter
  # `/*namespace_id/:project_id/builds/artifacts/*ref_name_and_path`
  #    -> 'builds/artifacts'
  def path_before_wildcard(path)
    path = path.gsub(STARTING_WITH_NAMESPACE, "")
    path_segments = path.split('/').reject(&:empty?)
    wildcard_index = path_segments.index { |segment| parameter?(segment) }

    segments_before_wildcard = path_segments[0..wildcard_index - 1]

    segments_before_wildcard.join('/')
  end

  def parameter?(segment)
    segment =~ /[*:]/
  end

  # If the path is reserved. Then no conflicting paths can# be created for any
  # route using this reserved word.
  #
  # Both `builds/artifacts` & `build` are covered by reserving the word
  # `build`
  def wildcards_include?(path)
    described_class::PROJECT_WILDCARD_ROUTES.include?(path) ||
      described_class::PROJECT_WILDCARD_ROUTES.include?(path.split('/').first)
  end

  def failure_message(constant_name, migration_helper, missing_words: [], additional_words: [])
    missing_words = Array(missing_words)
    additional_words = Array(additional_words)
    message = ""
    if missing_words.any?
      message += <<-MISSING
      Found new routes that could cause conflicts with existing namespaced routes
      for groups or projects.

      Nest <#{missing_words.join(', ')}> in a route containing `-`, that way
      we know there will be no conflicts with groups or projects created with those
      paths.

      MISSING
    end

    if additional_words.any?
      message += <<-ADDITIONAL
      Is <#{additional_words.join(', ')}> in `#{constant_name}` required?
      If they are really required, update these specs to reflect that.

      ADDITIONAL
    end

    message
  end

  let(:all_non_legacy_routes) do
    route_set = Rails.application.routes
    routes_collection = route_set.routes
    routes_array = routes_collection.routes

    non_legacy_routes = routes_array.reject do |route|
      route.name.to_s =~ /legacy_(\w*)_redirect/
    end

    non_deprecated_redirect_routes = non_legacy_routes.reject do |route|
      app = route.app
      # `app.app` is either another app, or `self`. We want to find the final app.
      app = app.app while app.try(:app) && app.app != app

      app.is_a?(ActionDispatch::Routing::PathRedirect) && app.block.include?('/-/')
    end

    non_deprecated_redirect_routes.map { |route| route.path.spec.to_s }
  end

  let(:routes_without_format) { all_non_legacy_routes.map { |path| without_format(path) } }

  # Routes not starting with `/:` or `/*`
  # all routes not starting with a param
  let(:routes_not_starting_in_wildcard) { routes_without_format.select { |p| p !~ %r{^/[:*]} } }

  let(:top_level_words) do
    words = routes_not_starting_in_wildcard.map do |route|
      route.split('/')[1]
    end.compact

    (words + ee_top_level_words + files_in_public + Array(API::API.prefix.to_s)).uniq
  end

  let(:ee_top_level_words) do
    ['unsubscribes']
  end

  let(:files_in_public) do
    git = Gitlab.config.git.bin_path
    tracked = `cd #{Rails.root} && #{git} ls-files public`
      .split("\n")
      .map { |entry| entry.gsub('public/', '') }
      .uniq
    tracked + %w(assets uploads)
  end

  # All routes that start with a namespaced path, that have 1 or more
  # path-segments before having another wildcard parameter.
  # - Starting with paths:
  #   - `/*namespace_id/:project_id/`
  #   - `/*namespace_id/:id/`
  # - Followed by one or more path-parts not starting with `:` or `*`
  # - Followed by a path-part that includes a wildcard parameter `*`
  # At the time of writing these routes match: http://rubular.com/r/Rv2pDE5Dvw
  STARTING_WITH_NAMESPACE = %r{^/\*namespace_id/:(project_)?id}
  NON_PARAM_PARTS = %r{[^:*][a-z\-_/]*}
  ANY_OTHER_PATH_PART = %r{[a-z\-_/:]*}
  WILDCARD_SEGMENT = /\*/
  let(:namespaced_wildcard_routes) do
    routes_without_format.select do |p|
      p =~ %r{#{STARTING_WITH_NAMESPACE}/#{NON_PARAM_PARTS}/#{ANY_OTHER_PATH_PART}#{WILDCARD_SEGMENT}}
    end
  end

  # This will return all paths that are used in a namespaced route
  # before another wildcard path:
  #
  # /*namespace_id/:project_id/builds/artifacts/*ref_name_and_path
  # /*namespace_id/:project_id/info/lfs/objects/*oid
  # /*namespace_id/:project_id/commits/*id
  # /*namespace_id/:project_id/builds/:build_id/artifacts/file/*path
  # -> ['builds/artifacts', 'info/lfs/objects', 'commits', 'artifacts/file']
  let(:all_wildcard_paths) do
    namespaced_wildcard_routes.map do |route|
      path_before_wildcard(route)
    end.uniq
  end

  STARTING_WITH_GROUP = %r{^/groups/\*(group_)?id/}
  let(:group_routes) do
    routes_without_format.select do |path|
      path =~ STARTING_WITH_GROUP
    end
  end

  let(:paths_after_group_id) do
    group_routes.map do |route|
      route.gsub(STARTING_WITH_GROUP, '').split('/').first
    end.uniq
  end

  describe 'TOP_LEVEL_ROUTES' do
    it 'includes all the top level namespaces' 

  end

  describe 'GROUP_ROUTES' do
    it "don't contain a second wildcard" 

  end

  describe 'PROJECT_WILDCARD_ROUTES' do
    it 'includes all paths that can be used after a namespace/project path' 

  end

  describe '.root_namespace_route_regex' do
    subject { %r{\A#{described_class.root_namespace_route_regex}/\z} }

    it 'rejects top level routes' 


    it 'accepts project wildcard routes' 


    it 'accepts group routes' 


    it 'is not case sensitive' 


    it 'does not allow extra slashes' 

  end

  describe '.full_namespace_path_regex' do
    subject { described_class.full_namespace_path_regex }

    context 'at the top level' do
      context 'when the final level' do
        it 'rejects top level routes' 


        it 'accepts project wildcard routes' 


        it 'accepts group routes' 

      end

      context 'when more levels follow' do
        it 'rejects top level routes' 


        it 'accepts project wildcard routes' 


        it 'accepts group routes' 

      end
    end

    context 'at the second level' do
      context 'when the final level' do
        it 'accepts top level routes' 


        it 'rejects project wildcard routes' 


        it 'rejects group routes' 

      end

      context 'when more levels follow' do
        it 'accepts top level routes' 


        it 'rejects project wildcard routes' 


        it 'rejects group routes' 

      end
    end

    it 'is not case sensitive' 


    it 'does not allow extra slashes' 

  end

  describe '.project_route_regex' do
    subject { %r{\A#{described_class.project_route_regex}/\z} }

    it 'accepts top level routes' 


    it 'rejects project wildcard routes' 


    it 'accepts group routes' 


    it 'is not case sensitive' 


    it 'does not allow extra slashes' 

  end

  describe '.full_project_path_regex' do
    subject { described_class.full_project_path_regex }

    it 'accepts top level routes' 


    it 'rejects project wildcard routes' 


    it 'accepts group routes' 


    it 'is not case sensitive' 


    it 'does not allow extra slashes' 

  end

  describe '.namespace_format_regex' do
    subject { described_class.namespace_format_regex }

    it { is_expected.to match('gitlab-ce') }
    it { is_expected.to match('gitlab_git') }
    it { is_expected.to match('_underscore.js') }
    it { is_expected.to match('100px.com') }
    it { is_expected.to match('gitlab.org') }
    it { is_expected.not_to match('?gitlab') }
    it { is_expected.not_to match('git lab') }
    it { is_expected.not_to match('gitlab.git') }
    it { is_expected.not_to match('gitlab.org.') }
    it { is_expected.not_to match('gitlab.org/') }
    it { is_expected.not_to match('/gitlab.org') }
    it { is_expected.not_to match('gitlab git') }
  end

  describe '.project_path_format_regex' do
    subject { described_class.project_path_format_regex }

    it { is_expected.to match('gitlab-ce') }
    it { is_expected.to match('gitlab_git') }
    it { is_expected.to match('_underscore.js') }
    it { is_expected.to match('100px.com') }
    it { is_expected.not_to match('?gitlab') }
    it { is_expected.not_to match('git lab') }
    it { is_expected.not_to match('gitlab.git') }
  end
end

