
json.service_request do 
  json.id @service_request.id
  json.creator_id @service_request.id
  json.creator_name @service_request.creator && @service_request.creator.name
  json.request_type @service_request.request_type
  json.created_at @service_request.created_at.strftime("%B %e, %Y %R")
end
