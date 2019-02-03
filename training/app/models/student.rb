class Student < Person
    # Attributes: name, lastname, citizen_id, login, password, student_number
    has_one :companion, class_name: "StudentCompagnion", inverse_of: :student, dependent: :destroy, autosave: true
    has_and_belongs_to_many :courses, class_name: "Course"
    delegate :student_number, :student_number=, to: :lazily_built_companion

    validates :student_number, presence: true
    
    def self.find(id)
        student = super(id)
        if student.student_number == nil
            raise ActiveRecord::RecordNotFound.new("Couldn't find Student with 'id'=#{id}")            
        end
        return student
    end   
    
    private
    def lazily_built_companion
        companion || build_companion
    end
end