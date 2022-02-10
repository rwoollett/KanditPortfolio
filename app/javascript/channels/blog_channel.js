import consumer from "channels/consumer"

jQuery(document).on('turbo:load', function() {
  var comments;
  comments = $('#comments');

  var global_chat = undefined;
  if (comments.length > 0) {
    global_chat = consumer.subscriptions.create({
      channel: "BlogChannel",
      blog_id: comments.data('blog-id')
    }, {
      connected() {
      },
      disconnected() {
      },
      received(data) {
        return comments.append(data['comment']);
      },
      send_comment(comment, blog_id) {
        return this.perform('send_comment', {
          comment: comment,
          blog_id: blog_id
        });
      }
    });
  }

  return $('#new_comment').on("submit", (function(e) {
    var $this, textarea;
    $this = $(this);
    textarea = $this.find('#comment_content');
    if (textarea.val().trim().length > 1) {
      global_chat.send_comment(textarea.val().trim(), comments.data('blog-id'));
      textarea.val('');
    }
    e.preventDefault();
    return false;
  }));
});
