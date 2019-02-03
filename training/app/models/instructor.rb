class Instructor < Person
    # Attributes: name, lastname, citizen_id, login, password, instructor_number
    has_one :companion, class_name: "InstructorCompagnion", inverse_of: :instructor, dependent: :destroy, autosave: true
    
    delegate :instructor_number, :instructor_number=, :departement_name, :departement_name=, to: :lazily_built_companion

    validates :instructor_number, presence: true
    
    private
    def lazily_built_companion
        companion || build_companion
    end
    
    def self.find(id)
        instructor = super(id)
        if instructor.departement_name == nil or instructor.instructor_number == nil
            raise ActiveRecord::RecordNotFound.new("Couldn't find Instructor with 'id'=#{id}")            
        end
        return instructor
    end    
end