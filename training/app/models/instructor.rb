class Instructor < Person
    # Attributes: name, lastname, citizen_id, login, password, instructor_id
    has_one :companion, class_name: "InstructorCompagnion", inverse_of: :instructor, dependent: :destroy, autosave: true
    
    delegate :instructor_id, :instructor_id=, :departement_name, :departement_name=, to: :lazily_built_companion

    validates :instructor_id, presence: true
    
    private
    def lazily_built_companion
        companion || build_companion
    end
end