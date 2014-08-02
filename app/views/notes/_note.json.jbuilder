json.(note, :id, :note, :service_request_id, :created_at)
json.user do
  json.partial! 'users/user', user: note.user
end
