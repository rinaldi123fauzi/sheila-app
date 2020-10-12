json.set! :data do
  json.array! @activity_titles do |activity_title|
    json.partial! 'activity_titles/activity_title', activity_title: activity_title
    json.url  "
              #{link_to 'Show', activity_title }
              #{link_to 'Edit', edit_activity_title_path(activity_title)}
              #{link_to 'Destroy', activity_title, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end