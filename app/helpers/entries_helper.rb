module EntriesHelper
  include
  def date_author_comments(entry)
    raw("<div class=""post_details"">Posted on #{entry.created_at.strftime('%d/%m/%Y')} by #{link_to(entry.user.name, user_path(entry.user))} |  #{link_to(pluralize(entry.comments.size, 'Comment'), entry_path(entry, anchor: 'commentlabel'))}</div>")
  end

  def author_edit_link(entry)
    if signed_in? && entry.user == current_user
      return raw("<div class=""author_edit_post"">#{link_to 'Edit Entry', edit_entry_path(entry)}</div>")
    end
    return ''
  end
end
