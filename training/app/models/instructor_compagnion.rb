class InstructorCompagnion < ActiveRecord::Base
    # Attributes: instructor_number
     belongs_to :instructor, inverse_of: :companion
     validates :departement_name, presence: true
     
     validates :instructor_number, presence: true, uniqueness: true, numericality: { only_integer: true, greater_than: 0 }
     
end