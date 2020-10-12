json.set! :data do
  json.array! @approve_statuses do |approve_status|
    json.partial! 'approve_statuses/approve_status', approve_status: approve_status
    json.url  "
              #{link_to 'Show', approve_status }
              #{link_to 'Edit', edit_approve_status_path(approve_status)}
              #{link_to 'Destroy', approve_status, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end