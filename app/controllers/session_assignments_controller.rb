class SessionAssignmentsController < InheritedResources::Base

  private

    def session_assignment_params
      params.require(:session_assignment).permit(:enrollment_id, :camp_occurrence_id)
    end

end
