module PostsHelper
  def join_tags(post)
    post.tags.map(&:name).join(",")
  end
end
