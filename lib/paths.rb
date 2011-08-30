module Paths
  
  class << self

    def base_dir
      File.expand_path(File.join(File.dirname(__FILE__), '..'))
    end

    def lib_dir
      File.join(base_dir, 'lib')
    end

    def config_dir
      File.join(base_dir, 'config')
    end

    def config_file
      File.join(config_dir, 'config.yaml')
    end

    def database_file
      File.join(config_dir, 'database.yaml')
    end
  end
end
