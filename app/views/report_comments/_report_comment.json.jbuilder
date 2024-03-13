json.extract! report_comment, :id, :report_id, :user_id, :content, :created_at, :updated_at
json.url report_comment_url(report_comment, format: :json)
