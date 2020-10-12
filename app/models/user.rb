class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :role_assignments, dependent: :destroy
  has_many :roles, through: :role_assignments
  has_many :timesheet
  belongs_to :assignment_place
  has_one :personil_detail

  devise :database_authenticatable, :recoverable, :validatable, :trackable

  def computed_permissions
    roles.map(&:computed_permissions).reduce(RoleCore::ComputedPermissions.new, &:concat)
  end
end
