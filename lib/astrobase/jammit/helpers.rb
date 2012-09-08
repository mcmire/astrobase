
require 'tagz'

module Astrobase::Jammit
  # Copied from Padrino
  module Helpers
    def self.included(base)
      base.__send__(:include, Tagz)
    end

    def stylesheet_link_tag(*sources)
      options = Hash === sources.last ? sources.pop : {}
      options = {
        :media => 'screen',
        :rel => 'stylesheet',
        :type => 'text/css'
      }.merge(options)
      sources = sources.flatten
      sources.map { |source|
        attrs = {:href => asset_path(:css, source)}.merge(options)
        tagz { link_(attrs) }
      }.join("\n")
    end

    def javascript_include_tag(*sources)
      options = sources.extract_options!.symbolize_keys
      options.reverse_merge!(:type => 'text/javascript')
      sources.flatten.map { |source|
        attrs = {:src => asset_path(:js, source)}.merge(options)
        tagz { script_(attrs); _script }
      }.join("\n")
    end

    def asset_path(kind, source)
      return source if source =~ /^http/
      is_absolute  = source =~ %r{^/}
      asset_folder = asset_folder_name(kind)
      source = source.to_s.gsub(/\s/, '%20')
      ignore_extension = (asset_folder.to_s == kind.to_s) # don't append an extension
      source << ".#{kind}" unless ignore_extension or source =~ /\.#{kind}/
      result_path = is_absolute ? source : uri_root_path(asset_folder, source)
      timestamp = asset_timestamp(result_path, is_absolute)
      "#{result_path}#{timestamp}"
    end

  private
    def asset_folder_name(kind)
      case kind
      when :css then 'stylesheets'
      when :js  then 'javascripts'
      else kind.to_s
      end
    end

    def uri_root_path(*paths)
      root_uri = self.class.uri_root if self.class.respond_to?(:uri_root)
      File.join(ENV['RACK_BASE_URI'].to_s, root_uri || '/', *paths)
    end

    def asset_timestamp(file_path, absolute=false)
      return nil if file_path =~ /\?/ || (self.class.respond_to?(:asset_stamp) && !self.class.asset_stamp)
      public_file_path = Astrobase.path('public', file_path)
      stamp = File.mtime(public_file_path).to_i if public_file_path && File.exist?(public_file_path)
      stamp ||= Time.now.to_i unless absolute
      "?#{stamp}" if stamp
    end
  end
end

