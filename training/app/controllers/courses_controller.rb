class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_course_model, :set_index_url, :set_instructor_model
  before_action :set_instructors_list, only: [:new,:edit, :update, :create]
  before_action :change_params, only: [:create, :update]
  # GET /people
  # GET /people.json
  def index
    @courses = @course_model.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end
  

  # GET /people/new
  def new
    @course = @course_model.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @course = @course_model.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "#{@course_model.to_s} was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "#{@course_model.to_s} was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to @index_url, notice: "#{@course_model.to_s} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    protected
    # Use callbacks to share common setup or constraints between actions.
    def set_course
        @course = Course.find(params[:id])
    end

    def set_course_model
        @course_model = Course
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
        params.require(:course).permit(:subject, :instructor_id)
    end
    
    def register_params
        params.require(:register).permit(:course, :student)
    end
  
    #override it if your controller is not to the form {model_name_plural}Controller
    def set_index_url
      @index_url = eval(self.class.to_s.remove(/Controller$/).downcase + "_url")
    end
    
    def set_instructors_list
        @instructors_list = @instructor_model.all.map{|i|[i.firstname + " " + i.lastname, i.id]}
    end
    
    def set_instructor_model
      @instructor_model = Instructor
    end
    
    def change_params
      course_params[:instructor] = @instructor_model.find course_params[:instructor_id]
    end
end
