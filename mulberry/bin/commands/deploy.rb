module Mulberry
  module Command
    class Deploy
      def initialize(args)
        options = {}
        OptionParser.new do |opts|
          opts.banner = "Usage: mulberry deploy [options]"

          opts.on("--skip-js-build", "Disable JavaScript build task.") do |v|
            options[:skip_js_build] = v
          end
        end.parse!

        dir = Mulberry.get_app_dir args[0]

        app = Mulberry::App.new(dir)
        app.device_build options
      end
    end
  end
end