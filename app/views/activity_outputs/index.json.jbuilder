json.set! :data do
  json.array! @activity_outputs do |activity_output|
    json.partial! 'activity_outputs/activity_output', activity_output: activity_output
    json.url  "
              #{link_to 'Show', activity_output }
              #{link_to 'Edit', edit_activity_output_path(activity_output)}
              #{link_to 'Destroy', activity_output, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end