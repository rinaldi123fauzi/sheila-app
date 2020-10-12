class Position < ApplicationRecord
  has_many :personil_detail
  has_many :assignment
end
