class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  after_create :new_participant_send


  def new_participant_send
    AttendanceMailer.new_participant(self).deliver_now
  end

end
