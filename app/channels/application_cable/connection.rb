module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # When benchmarking, replace the line below for -> identified_by :id
    identified_by :id

    def connect
      # Modify this variable if you are planning to benchmark action cable
      amIBenchmarking = true
      if (amIBenchmarking)
        self.id = SecureRandom.uuid
        logger.add_tags 'ActionCable', id
      else
        self.current_user = find_verified_user
        logger.add_tags 'ActionCable', current_user
      end
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      if verified_user = env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
