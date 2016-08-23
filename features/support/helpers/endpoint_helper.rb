module EndpointHelper
  def self.host_base
    hostname = case ENV['APP_HOST']
               when "DEV"
                 'http://localhost'
               else
                 # else handles the "QA" situation so it's the default
                 'http://'
               end

    hostname
  end

  def self.app_base
    hostname = case ENV['APP_HOST']
               when 'DEV'
                 "#{host_base}:8080"
               else
                 host_base
               end

    hostname
  end

  def self.cleaner_base
    path = 'api/qa'
    hostname = case ENV['APP_HOST']
               when 'DEV'
                 "#{host_base}:3000/#{path}"
               else
                 "#{host_base}/#{path}"
               end

    hostname
  end
end
