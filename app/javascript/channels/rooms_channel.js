import consumer from "./consumer"
$(document).on('turbolinks:load', () => {
  const messages = $('#messages')
  const messages_to_bottom = () => messages.scrollTop(messages.prop("scrollHeight"))

  if ($('#messages').length > 0) {
    messages_to_bottom()

    const currentConsumer = consumer.subscriptions.create ({
      channel: "RoomsChannel",
      chat_room_id: messages.data('chat-room-id')
    },{
      connected: () => {},

      disconnected: () => {},

      received: (data) => {
        messages.append(data['message'])
        messages_to_bottom()
      },

      send_message: (message, chat_room_id) => {
        currentConsumer.perform('send_message', { message: message , chat_room_id: chat_room_id })
      }
    })

    $('#new_message').submit(e => {
      // Don't redirect to rails route
      e.preventDefault()
      const textarea = $(e.target).find('#message_body')
      if ($.trim(textarea.val()).length > 1) {
        currentConsumer.send_message(textarea.val(), messages.data('chat-room-id'))
        textarea.val('')
      }
      return false
    })
  }
})