class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_person_model, :set_index_url

  # GET /people
  # GET /people.json
  def index
    @people = @person_model.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end
  

  # GET /people/new
  def new
    @person = @person_model.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = @person_model.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "#{@person_model.to_s} was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: "#{@person_model.to_s} was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to @index_url, notice: "#{@person_model.to_s} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    protected
    # Use callbacks to share common setup or constraints between actions.
    def set_person
    end

    def set_person_model
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
    end
  
    #override it if your controller is not to the form {model_name_plural}Controller
    def set_index_url
      @index_url = eval(self.class.to_s.remove(/Controller$/).downcase + "_url")
    end
end
