json.set! :data do
  json.array! @assignment_places do |assignment_place|
    json.partial! 'assignment_places/assignment_place', assignment_place: assignment_place
    json.url  "
              #{link_to 'Show', assignment_place }
              #{link_to 'Edit', edit_assignment_place_path(assignment_place)}
              #{link_to 'Destroy', assignment_place, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end