class ConcourseProjectStrategy
  def initialize(requester, concourse_authenticator)
    @requester = requester
    @concourse_authenticator = concourse_authenticator
  end

  def create_handler(project)
    ProjectWorkloadHandler.new(project)
  end

  def create_workload(project)
    workload = PollerWorkload.new
    workload.add_job(:feed_url, project.feed_url)
    workload.add_job(:build_status_url, project.build_status_url)
    workload
  end

  # returns a request that gets callback/errback assigned to it
  def fetch_status(project, url)
    @concourse_authenticator.authenticate(project.auth_url, project.auth_username, project.auth_password) do |auth_poll_state, auth_status_code, auth_response|
      if auth_poll_state != PollState::SUCCEEDED
        yield auth_poll_state, auth_response, auth_status_code
      else
        request_options = {
            head: {'Cookie' => "ATC-Authorization=Bearer #{auth_response}"}
        }

        if project.accept_mime_types.present?
          headers = request_options[:head] || {}
          request_options[:head] = headers.merge('Accept' => project.accept_mime_types)
        end

        request = @requester.initiate_request(url, request_options)

        request.callback do |client|
          yield PollState::SUCCEEDED, client.response, client.response_header.status
        end

        request.errback do |client|
          yield PollState::FAILED, client.response, -1
        end
      end
    end
  end
end