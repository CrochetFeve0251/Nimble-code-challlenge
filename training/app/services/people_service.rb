module PeopleService
  class << self
    before_action :set_models
    def find(id)
        @models.each do |model|
            begin
                return model.find id
            rescue ActiveRecord::RecordNotFound
            end
        end     
        raise ActiveRecord::RecordNotFound.new("Couldn't find Person with 'id'=#{id}")    
    end
    
    private
    #order of models is important cause all person are Extern but Extern are not Intructors nor Student
    def set_models
        @models = [Instructor, Student, Extern]
    end
  end
end