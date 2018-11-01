# frozen_string_literal: true

class CollectionForm < Sufia::Forms::CollectionForm
  delegate :depositor, :permissions, to: :model

  attr_reader :current_ability, :request

  self.terms += [:subtitle]
  self.required_fields = [:title, :description, :keyword]

  include WithCreator
  include HydraEditor::Form::Permissions

  # @param [Collection] model
  # @param [Ability] current_ability
  # @param [ActionDispatch::Request] request
  # Overrides CurationConcerns::CollectionEditForm to add current_ability and request to the form.
  def initialize(model, current_ability, request)
    @current_ability = current_ability
    @request = request
    super(model)
  end

  def self.multiple?(field)
    if field.to_sym == :title
      false
    else
      super
    end
  end

  def self.model_attributes(_)
    attrs = super
    attrs[:title] = Array(attrs[:title]) if attrs[:title]
    attrs
  end

  def model_class_name
    'collection'
  end

  def title
    super.first || ''
  end

  # @return [Array<WorkShowPresenter>]
  # This is so we can display the title and other pertinent information about the works
  # that will be added to a collection.
  def incorporated_work_presenters
    CurationConcerns::PresenterFactory.build_presenters(batch_document_ids,
                                                        WorkShowPresenter,
                                                        current_ability, request)
  end

  # return [Array<SolrDocument]
  def incorporated_member_docs
    incorporated_work_presenters.map(&:solr_document)
  end

  def primary_terms
    [:title, :subtitle, :creator, :description, :keyword]
  end

  def secondary_terms
    [
      :contributor, :rights, :publisher, :date_created, :subject, :language, :identifier,
      :based_near, :related_url, :resource_type
    ]
  end

  def create_doi
    model.doi.present?
  end

  def show_doi_form?
    true
  end

  private

    def batch_document_ids
      return [] unless request
      request.filtered_parameters.fetch('batch_document_ids', [])
    end
end
