class Message < ApplicationRecord
 include CableReady::Broadcaster

  def broadcast
    cable_ready["chat_channel"].insert_adjacent_html(
      selector: "#messages",
      position: 'afterbegin',
      html: "<a href='#' class='list-group-item list-group-item-action'>
              <p class='mb-1'>#{body}</p>
              <small class='text-muted'>#{username}</small>
            </a>"
    )

    cable_ready.broadcast
  end
end
