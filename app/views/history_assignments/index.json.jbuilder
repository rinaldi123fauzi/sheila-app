json.set! :data do
  json.array! @history_assignments do |history_assignment|
    json.partial! 'history_assignments/history_assignment', history_assignment: history_assignment
    json.url  "
              #{link_to 'Show', history_assignment }
              #{link_to 'Edit', edit_history_assignment_path(history_assignment)}
              #{link_to 'Destroy', history_assignment, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end