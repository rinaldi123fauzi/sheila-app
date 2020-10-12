class ApproveStatus < ApplicationRecord
  belongs_to :timesheet, optional: true
end
