class GroupsController < ApplicationController
    before_action :set_group, only: [:show, :edit, :update, :destroy, :submit_work, :submit_mark]
    before_action :set_group_model, :set_index_url
    before_action :set_course, :set_student_list, :set_course_model, only: [:index, :edit, :new, :create, :update, :show]
    before_action :submit_mark_params, only: [:submit_mark]
    before_action :submit_work_params, only: [:submit_work]
  
    def submit_work
        @group.work = params[:work]
        format.html { redirect_to @group, notice: "Your work was successfully submited." }
        format.json { render :show, status: :created, location: @group }
    end
    
    def submit_mark
        @group.mark = params[:mark]
        format.html { redirect_to @group, notice: "The mark was successfully added." }
        format.json { render :show, status: :created, location: @group }
    end
    

  def index
    @groups = @course.groups
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end
  

  # GET /people/new
  def new
    @group = @group_model.new
  end

  # POST /group
  # POST /group.json
  def create
    @group = @group_model.new(group_params)
    respond_to do |format|
      if @group.save
        @course.groups<< @group
        format.html { redirect_to course_group_path(@course,@group), notice: "#{@group_model.to_s} was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group/1
  # DELETE /group/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to @index_url, notice: "#{@group_model.to_s} was successfully destroyed." }
      format.json { head :no_content }
    end
  end
protected
    def set_group
        @group = Group.find(params[:id])
    end
    
    def set_course
        @course = Course.find(params[:course_id])
    end
    
    def set_student_list
        @student_list = @course.students.map{|i|[i.firstname + " " + i.lastname, i.id]}
    end
    
    def set_course_model
      @course_model = Course
    end
    
    def group_params
        params.require(:group).permit(:subject, :students)
    end    
    
    def submit_work_params
        params.require(:group).permit(:work)
    end
    
    def submit_mark_params
        params.require(:group).permet(:mark)
    end
    
    def set_group_model
        @group_model = Group
    end
    
     #override it if your controller is not to the form {model_name_plural}Controller
    def set_index_url
      @index_url = eval("course_" + self.class.to_s.remove(/Controller$/).downcase + "_url")
    end
end
