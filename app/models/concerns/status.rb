module Status
  extend ActiveSupport::Concern

  STATUSES = {'Enabled' => 1, 'Disabled' => 0 }

  included do
    #validates :status, inclusion: { in: %w[1 0] }
  end

  class_methods do
    def public_count
      where(status: '1').count
    end
  end

  def disabled?
    status == '0'
  end
end