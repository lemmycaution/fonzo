module Fonzo
  module Generators    
    class InstallGenerator < Rails::Generators::Base
      
      desc "Installs Fonzo"

      def self.source_root
        @_faps_source_root ||= File.expand_path("../templates", __FILE__)
      end  

      def copy_initializer
        template 'fonzo.rb.erb', 'config/initializers/fonzo.rb'
      end
      
      def setup_routes
        route "Fonzo.apply"
      end
      
    end
  end
end