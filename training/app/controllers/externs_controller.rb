class ExternsController < PeopleController
    protected
    def set_person
        @person = Extern.find(params[:id])
    end
    
    protected
    def person_params
        params.require(:extern).permit(:firstname, :lastname, :login, :password, :citizen_id)
    end    

    def set_person_model
        @person_model = Extern
    end
end
