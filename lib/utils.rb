module Utils

  def unzip_file file, destination
    Zip::ZipFile.open(file) do |zip_file|
      zip_file.each do |f|
        f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end
  end

  def download_file url, destination
    url = URI.parse url

    Net::HTTP.start(url.host) do |http|
      req = Net::HTTP::Get.new(url.request_uri, nil)

      current = 0
      http.request(req) do |response|
        size = response.content_length
        File.open(destination, "wb") do |file|
          response.read_body do |segment|
            current += segment.length
            if(current != 0)
              percent = (current * 100) / size
              $log.info "Downloading #{url} #{percent}%%\r", false
            end
            file.write(segment)
          end
        end
        $log.info "Downloading #{url} DONE"
      end
    end
  end

end
