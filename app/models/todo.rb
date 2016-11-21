class Todo < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def self.indexed
    all.select(:id, :title)
  end

end
