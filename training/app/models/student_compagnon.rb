class StudentCompagnon < ActiveRecord::Base
    # Attributes: student_id
     belongs_to :student, inverse_of: :companion
     validates :student_id, presence: true
     
     validates :student_id, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
     
end