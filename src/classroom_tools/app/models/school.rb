class School < ApplicationRecord
  has_secure_password
  has_many :classrooms
  has_many :students, through: :classrooms
end
