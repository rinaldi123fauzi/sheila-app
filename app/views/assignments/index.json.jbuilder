json.set! :data do
  json.array! @assignments do |assignment|
    json.partial! 'assignments/assignment', assignment: assignment
    json.url  "
              #{link_to 'Show', assignment }
              #{link_to 'Edit', edit_assignment_path(assignment)}
              #{link_to 'Destroy', assignment, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end