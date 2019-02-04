require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @course = Course.new
  end
  
  test "Should add Student" do
    student = Student.new
    assert_nothing_raised ActiveRecord::AssociationTypeMismatch do
      @course.persons<< student
    end
  end
  
  test "Should add Instructor" do
    instructor = Instructor.new
    assert_nothing_raised ActiveRecord::AssociationTypeMismatch do
          @course.persons<< instructor
    end
  end
  
  test "Should add Extern" do
    extern = Extern.new
    assert_nothing_raised ActiveRecord::AssociationTypeMismatch do
          @course.persons<< extern
    end
  end
end
