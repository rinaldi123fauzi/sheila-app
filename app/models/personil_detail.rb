class PersonilDetail < ApplicationRecord
  belongs_to :user
  belongs_to :assignment_place
  belongs_to :position

  has_one_attached :photo_personil

  attr_accessor :username

  after_create :setUserLogin

  private
  def setUserLogin
    User.create!(username: username, email: self.email, password: "123123", name: self.nama_lengkap, assignment_place_id: self.assignment_place_id)
    @getUser = User.last
    PersonilDetail.update(self.id, :user_id => @getUser.id)
    RoleAssignment.create!(user_id: @getUser.id, role_id: 2)
  end
end
