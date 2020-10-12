class Timesheet < ApplicationRecord
  belongs_to :user
  belongs_to :activity_title
  belongs_to :activity_output
  belongs_to :assignment_place
  has_many :approve_status, dependent: :destroy

  after_create :setStatusApprove

  def setStatusApprove
    @filter = ApproveStatus.find_by_parent_timesheet_id(self.parent_id)
    unless @filter.present?
      ApproveStatus.create!(
          parent_timesheet_id: self.parent_id,
          status1: "pending",
          status2: "pending",
          status3: "pending",
          status4: "pending",
      )

      HistoryTimesheet.create!(
          parent_timesheet_id: self.parent_id,
          status: "pending",
          status_info: "pending_approve",
          tertuju_info: "Approve1"
      )
    end

    selesai_jam = self.jam_selesai.strftime('%H')
    mulai_jam = self.jam_mulai.strftime('%H')

    selesai_menit = self.jam_selesai.strftime('%M')
    mulai_menit = self.jam_mulai.strftime('%M')

    t_hour =  selesai_jam.to_i - mulai_jam.to_i
    t_minute =  selesai_menit.to_i - mulai_menit.to_i
    sec = t_hour*60 + t_minute

    self.minute_total = sec
    self.save!
  end
end
