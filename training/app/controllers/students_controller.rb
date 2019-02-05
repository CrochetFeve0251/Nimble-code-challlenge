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
        @person_model = Student
    end
    
     def sign_up_params
        params.require(:student).permit( :name, :email, :password, :password_confirmation, :firstname, :lastname, :login, :password, :citizen_id, :student_number)
     end

    def account_update_params
        params.require(:student).permit(:firstname, :lastname, :login, :password, :citizen_id, :student_number)
    end
end
