class RoleDecorator < Draper::Decorator

  delegate_all
  decorates_association :users, scope: :technical_active
  decorates_association :memberships

  def label
    h.content_tag :span, name, class: "label label-default", style: "background-color: #{color}"
  end
end
