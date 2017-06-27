module ApplicationHelper

  def print_sub_comments(comment)
    unless comment.child_comments
      puts
      return link_to comment.content, comment_url(comment)
    else
      comment.child_comments.each do |child_comment|
        "<br>".html_safe
        print_sub_comments(child_comment)
      end
    end
    puts
    link_to comment.content, comment_url(comment)
  end
end
