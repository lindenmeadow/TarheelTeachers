module DiscussionsHelper
    def discussion_author(discussion)
        signed_in? && current_user.id == discussion.user_id
    end
      
    def comment_author(comment)
        signed_in? && current_user.id == comment.user_id
    end
end
