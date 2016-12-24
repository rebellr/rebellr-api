json.extract! session, :id, :user_id, :auth_token, :expiry_date, :created_at, :updated_at
json.url session_url(session, format: :json)