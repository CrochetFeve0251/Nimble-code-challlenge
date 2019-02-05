module Connected
 extend ActiveSupport::Concern
  included do
    before_action :check_connected
  end

  protected
  def check_connected
    if current_student or current_instructor or current_extern
     return
    else
      flash.clear
      redirect_to(root_path) && return
    end
  end
end