class AssignmentPlace < ApplicationRecord
  has_many :personil_detail
  has_many :timesheet
  has_many :user
  has_many :assignment
end
