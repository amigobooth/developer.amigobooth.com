require 'pp'
require 'yajl/json_gem'
require 'stringio'
require 'cgi'
require 'securerandom'

module AmigoBooth
  module Resources
    module Helpers
      STATUSES = {
        200 => '200 OK',
        201 => '201 Created',
        202 => '202 Accepted',
        204 => '204 No Content',
        205 => '205 Reset Content',
        301 => '301 Moved Permanently',
        302 => '302 Found',
        307 => '307 Temporary Redirect',
        304 => '304 Not Modified',
        401 => '401 Unauthorized',
        403 => '403 Forbidden',
        404 => '404 Not Found',
        405 => '405 Method not allowed',
        409 => '409 Conflict',
        422 => '422 Unprocessable Entity',
        500 => '500 Server Error'
      }

      DefaultTimeFormat = "%B %-d, %Y".freeze

      def post_date(item)
        strftime item[:created_at]
      end

      def strftime(time, format = DefaultTimeFormat)
        attribute_to_time(time).strftime(format)
      end

      def headers(status, head = {})
        css_class = (status == 204 || status == 404) ? 'headers no-response' : 'headers'
        lines = ["Status: #{STATUSES[status]}"]
        head.each do |key, value|
          case key
            when :pagination
              lines << 'Link: <https://amigobooth.com/api/v1/resource?page=2>; rel="next",'
              lines << '      <https://amigobooth.com/api/v1/resource?page=5>; rel="last"'
            else lines << "#{key}: #{value}"
          end
        end

        lines << "X-RateLimit-Limit: 5000"
        lines << "X-RateLimit-Remaining: 4999"

        %(<pre class="#{css_class}"><code>#{lines * "\n"}</code></pre>\n)
      end

      def json(key)
        hash = case key
          when Hash
            h = {}
            key.each { |k, v| h[k.to_s] = v }
            h
          when Array
            key
          else Resources.const_get(key.to_s.upcase)
        end

        hash = yield hash if block_given?

        %(<pre class="highlight"><code class="language-javascript">) +
          JSON.pretty_generate(hash) + "</code></pre>"
      end

      def text_html(response, status, head = {})
        hs = headers(status, head.merge('Content-Type' => 'text/html'))
        res = CGI.escapeHTML(response)
        hs + %(<pre class="highlight"><code>) + res + "</code></pre>"
      end

    end

    CREATED_AT = "2012-12-09T17:58:26Z"

    KEY = {
      "token"      => "Mk3W4dTvpdUNar7AB3RD4PBoT8Py9wFNZ7WakvQP",
      "created_at" => CREATED_AT
    }

    USER = {
      "id"           => 1,
      "login"        => "dwight",
      "name"         => "Dwight Schrute",
      "email"        => "dwight@amigobooth.com",
      "api_url"      => "https://amigobooth.com/api/v1/users/dwight",
      "html_url"     => "https://amigobooth.com/dwight",
      "created_at"   => CREATED_AT
    }

    USER_FULL = USER.merge({
    })

    USER_AUTHENTICATED = USER_FULL.merge({
      "event_credits"       => 100,
      "total_events"        => 100,
    })

    COORDINATES = [32.7993, -117.16]

    EVENT = {
      "id"           => 1,
      "name"         => "Office Party",
      "date"         => "2012-10-28",
      "api_url"      => "https://amigobooth.com/api/v1/users/dwight/events/1-office-party",
      "html_url"     => "https://amigobooth.com/api/v1/dwight/1-office-party",
      "created_at"   => CREATED_AT,
      "shots_count"  => 142,
      "private"      => true,
      "owner"        => USER,
      "coordinates"  => COORDINATES
    }

    EVENT_FULL = EVENT.merge({})

    EVENT_AUTHENTICATED = EVENT_FULL.merge({
      "password"          => "dundermiflin",
      "editing_preset"    => "none",
      "facebook_album_id" => "903973659337539"
    })

    PHOTO = {
      "file_name"                => "IMG_0001.JPG",
      "file_size"                => 398681,
      "fingerprint"              => "5628bba5f4a6a357ff45e84d5441be86",
      "url"                      => "https://d13sylefetbos4.cloudfront.net/s/1/acbd18db4cc2f85cedef654fccc4a4d8.JPG",
      "download_url"             => "https://d13sylefetbos4.cloudfront.net/s/1/299a0be4a5a79e6a59fdd251b19d78bb.JPG",
      "download_watermarked_url" => "https://d13sylefetbos4.cloudfront.net/s/1/92e0057157f69e22a364d6b22dd6bbd5.JPG",
      "thumb_url"                => "https://d13sylefetbos4.cloudfront.net/s/1/cecf7c1a4c5640928a3a73459bb3d977.JPG",
      "medium_url"               => "https://d13sylefetbos4.cloudfront.net/s/1/1255e970941d7da002de246b63e8ceb4.JPG",
      "taken_at"                 => CREATED_AT
    }

    SHOT = {
      "id"           => 1,
      "event_id"     => EVENT["id"],
      "created_at"   => CREATED_AT,
      "updated_at"   => CREATED_AT,
      "processed"    => true,
      "share_url"    => "https://amigobooth.com/s/M4JmM3TSe5sfXxs82WcQ",
      "photo"        => PHOTO
    }

    SHOT_FULL = SHOT.merge({})

    SHOT_AUTHENTICATED = SHOT_FULL.merge({})

  end
end

include AmigoBooth::Resources::Helpers
