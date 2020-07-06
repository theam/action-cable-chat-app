class BenchmarkChannel < ApplicationCable::Channel
  def subscribed
    stream_from id
    stream_from "all"
    Rails.logger.info "a client subscribed: #{id}"
  end

  def echo(data)
    ActionCable.server.broadcast id, data
  end

  def broadcast(data)
    ActionCable.server.broadcast "all", data
    data["action"] = "broadcastResult"
    ActionCable.server.broadcast id, data
  end
end
