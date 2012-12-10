

# Engine's path issue
# https://github.com/rails/rails/issues/8119
# config.relative_url_root = ''

# Avoids wrong number of arguments (2 for 1) callback issue
# https://github.com/thoughtbot/paperclip/issues/1086
module Paperclip
  module Callbacks
    module Running
      def run_paperclip_callbacks(callback, &block)
        run_callbacks(callback, &block)
      end
    end
  end
end
