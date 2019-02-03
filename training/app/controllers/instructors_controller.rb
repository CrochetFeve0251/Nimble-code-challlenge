class InstructorsController < PeopleController

    protected
    def set_person
        @person = Instructor.find(params[:id])
    end
    
    protected
    def person_params
        params.require(:instructor).permit(:firstname, :lastname, :login, :password, :citizen_id, :instructor_number, :departement_name)
    end    

    def set_person_model
        @person_model = Instructor
    end
end
