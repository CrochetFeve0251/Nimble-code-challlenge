class StudentsController < PeopleController
    protected
    def set_person
        @person = Student.find(params[:id])
    end
    
    protected
    def person_params
        params.require(:student).permit(:firstname, :lastname, :login, :password, :citizen_id, :student_number)
    end    

    def set_person_model
        print "ok"
        @person_model = Student
    end
end
