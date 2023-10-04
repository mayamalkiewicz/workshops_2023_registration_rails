class Task < ApplicationRecord
  validates :title, presence: true

  scope :sort_by_nearest_deadline, -> { 
    where("deadline IS NULL OR deadline >= ?", Time.now)
      .order(Arel.sql('CASE WHEN deadline IS NULL THEN 1 ELSE 0 END, deadline')) 
  }
  scope :past, -> { where("deadline < ?", Time.now).order(:deadline) }
  scope :no_deadline, -> { where(deadline: nil) }
end
