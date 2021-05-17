class Event < ApplicationRecord
  belongs_to :user, optional: true
  has_many :attendances

  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "La date ne peut pas être passée !")
    end
  end

  validates :duration, presence: true, numericality: {:greater_than_or_equal_to => 0}
  validate :duration_modulo_five
  def duration_modulo_five
    if (duration.to_i%5  != 0)
      errors.add(:duration, "La durée doit être un multiple de 5")
    end
  end

  validates :title, presence: true, length: { in: 5..140 }

  validates :description, presence: true, length: { in: 20..1000 }

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }

  validates :location, presence: true


end
