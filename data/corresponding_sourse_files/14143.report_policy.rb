class ReportPolicy < BasePolicy
  def index?
    admin? || mi?
  end

  def show?
    admin? || mi?
  end

  def graphs?
    admin?
  end

  def public?
    admin?
  end

  def letter?
    staff_or_manager? || admin_or_mi?
  end

  def raw_data?
    admin_or_mi?
  end
end
