require 'koala'
    
module Fonzo

  mattr_accessor :filters  
  @@filters = {
    :ensure_canvas_app => {:paths => [], :params => {}},
    :ensure_tab_app => {:paths => [], :params => {}},    
    :ensure_liked => {:paths => [], :params => {}},    
    :ensure_registered => {:paths => [], :params => {}},    
  }

  def self.setup
    yield self
  end

  def self.method_missing(id,*args)
    yield filters[id.to_sym]
    # yield filters[Regexp.last_match(1).to_sym] if id.id2name =~ /ensure_(.+)/
  end

  def self.routes(map)
    map.instance_exec do

      Fonzo.filters.each do |name,options|  
        options[:paths].each do |path|          
          match path => ( options[:route] ? options[:route] : redirect(options[:redirect]) ),
          :constraints => "Fonzo::Constraints::#{name.to_s.classify}".constantize.new(options)
        end
      end 

    end
  end

  module Constraints

    class Ensure
      def initialize(options)
        @options = options
      end
      def signed_request(request)
        oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'])
        signed_request = oauth.parse_signed_request(request.params[:signed_request]) if request.params[:signed_request]
      end
      def matches?(request)
        @options[:params].each { |k,v| request.params[k] = v }
      end
    end

    class EnsureCanvasApp < Ensure
      def matches?(request)
        super
        true unless signed_request(request)
      end
    end

    class EnsureTabApp < Ensure
      def matches?(request)
        super
        sr = signed_request(request)
        true unless sr and sr['page']
      end
    end

    class EnsureLiked < Ensure
      def matches?(request)
        super
        sr = signed_request(request)
        true unless sr and sr['page'] and sr['page']['liked']
      end
    end

    class EnsureRegistered < Ensure
      def matches?(request)
        super
        sr = signed_request(request)
        true unless sr and sr['oauth_token']
      end
    end

  end

end