class Todo < ApplicationRecord
  validates :title, :done, presence: true
  validates :title, uniqueness: true
end
