require "rails_helper"

describe "donations/edit" do
  context "when the donation is pending" do
    it "hides additional form fields" 

  end

  context "when the donation is confirmed" do
    it "displays additional form fields" 

  end

  context "when the donation is declined" do
    it "hides additional form fields" 

  end

  def expect_rendered_not_to_have_form
    expect(rendered).not_to have_name("size")
    expect(rendered).not_to have_name("notes")
    expect(rendered).not_to have_update_button
  end

  def have_edit_prompt
    have_text t("donations.edit.prompt")
  end

  def have_update_button
    have_css(%{[type="submit"][value="#{t('helpers.submit.donation.update')}"]})
  end

  def have_role(role)
    have_css(%{[data-role="#{role}"]})
  end

  def have_name(name)
    have_css(%{[name="donation[#{name}]"]})
  end

  def have_disabled_button(type)
    have_css("button[disabled]", text: t("donations.#{type}.text"))
  end

  def have_enabled_button(type)
    have_css("button:not([disabled])", text: t("donations.#{type}.text"))
  end
end

