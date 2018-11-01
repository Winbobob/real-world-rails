class EvidenceController < ApplicationController
  before_action :authorize_evidence_check_update, except: :show

  include SectionViewsHelper

  def show
    authorize evidence

    processing_details
    build_sections
  end

  def accuracy
    @form = Forms::Evidence::Accuracy.new(evidence)
  end

  def accuracy_save
    @form = Forms::Evidence::Accuracy.new(evidence)
    @form.update_attributes(accuracy_params)

    if @form.save
      redirect_after_accuracy_save
    else
      render :accuracy
    end
  end

  def income
    @form = Forms::Evidence::Income.new(evidence)
  end

  def income_save
    @form = Forms::Evidence::Income.new(evidence)
    @form.update_attributes(income_params)

    if @form.save
      redirect_to result_evidence_path
    else
      render :income
    end
  end

  def result
    application_result
  end

  def summary
    evidence_view
    build_sections
    application_result
  end

  def summary_save
    ResolverService.new(evidence, current_user).complete
    process_evidence_check_flag
    redirect_to confirmation_evidence_path
  end

  def confirmation
    evidence_confirmation
  end

  def return_letter
    build_sections
  end

  def return_application
    if ResolverService.new(evidence, current_user).return
      process_evidence_check_flag
      redirect_to root_path
    end
  end

  def process_evidence_check_flag
    evidence_check = EvidenceCheckFlaggingService.new(evidence)
    evidence_check.process_flag if evidence_check.can_be_flagged?
  end

  private

  def authorize_evidence_check_update
    authorize evidence, :update?
  end

  def evidence
    @evidence ||= EvidenceCheck.find(params[:id])
  end

  def application
    evidence.application
  end

  def processing_details
    @processing_details = Views::ProcessedData.new(evidence.application)
  end

  def evidence_view
    @evidence_view = Views::Evidence.new(evidence)
  end

  def accuracy_params
    params.require(:evidence).permit(*Forms::Evidence::Accuracy.permitted_attributes)
  end

  def redirect_after_accuracy_save
    if @form.correct
      redirect_to income_evidence_path
    else
      redirect_to summary_evidence_path
    end
  end

  def income_params
    params.require(:evidence).permit(*Forms::Evidence::Income.permitted_attributes)
  end

  def application_result
    @result = Views::ApplicationResult.new(evidence.application)
  end

  def evidence_confirmation
    @confirmation = evidence
  end
end