class Assignment < ApplicationRecord
  belongs_to :position
  belongs_to :service_type
  belongs_to :assignment_place

  has_many_attached :file_assignment

  after_create :setParent

  after_create :setStatusApprove

  def setParent
    Assignment.update(self.id, parent_id: self.nama.to_s + "_" + self.id.to_s)
  end

  def setStatusApprove
    ApproveStatus.create!(
        parent_assignment_id: self.nama.to_s + "_" + self.id.to_s,
        status1: "pending",
        status2: "pending",
        status3: "pending",
        status4: "pending",
    )

    HistoryAssignment.create!(
        parent_assignment_id: self.nama.to_s + "_" + self.id.to_s,
        status: "pending",
        status_info: "pending_approve",
        tertuju_info: "Approve1",
        id_assignment: self.id
    )
  end

end
