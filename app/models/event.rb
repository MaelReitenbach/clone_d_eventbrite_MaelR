class Event < ApplicationRecord
  belongs_to :administrator, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances

  validate :start_date_is_future
  validate :duration_multiple_of_5
  validates :start_date,
  presence: true

  validates :duration,
  presence: true,
  numericality: { greater_than: 0 }

  validates :title,
  presence: true,
  length: { in: 5..140 }

  validates :description,
  presence: true,
  length: { in: 20..1000 }

  validates :price,
  presence: true,
  numericality: { greater_than: 1, less_than: 1000 }
  
  validates :location,
  presence: true
 



  def start_date_is_future
    return if start_date.blank?

    if start_date < Time.now
      errors.add(:start_date, "dates are incorrects") 
    end 
  end

  def duration_multiple_of_5
    if (duration%5) != 0
      errors.add(:duration, "must be mutilple of 5") 
    end 
  end

  def end_date
    duration_sec = duration * 60
    enddate = (start_date.to_i + duration_sec.to_i) - (120*60)
    end_date = Time.at(enddate)
    return end_date

  end

end
