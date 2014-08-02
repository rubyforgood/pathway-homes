json.id @service_request.id
json.creator_id @service_request.id
json.creator_name @service_request.creator && @service_request.creator.name
json.request_type @service_request.request_type
json.created_at @service_request.created_at.strftime("%B %e, %Y %R")
json.community_name @service_request.community_name
json.pet @service_request.pet
json.status @service_request.status
json.description @service_request.work_desc
json.instructions @service_request.special_instructions
