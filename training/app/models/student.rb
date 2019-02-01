class Student < Person
    # Attributes: name, lastname, citizen_id, login, password, student_id
    has_one :companion, class_name: "StudentCompagnion", inverse_of: :student, dependent: :destroy, autosave: true
    
    delegate :student_id, :student_id=, to: :lazily_built_companion

    validates :student_id, presence: true
    
    private
    def lazily_built_companion
        companion || build_companion
    end
end