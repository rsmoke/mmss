json.extract! course, :id, :camp_occurrence_id, :title, :available_spaces, :status, :created_at, :updated_at
json.url course_url(course, format: :json)
