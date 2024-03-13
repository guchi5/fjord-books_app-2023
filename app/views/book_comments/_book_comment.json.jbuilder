json.extract! book_comment, :id, :book_id, :user_id, :content, :created_at, :updated_at
json.url book_comment_url(book_comment, format: :json)
