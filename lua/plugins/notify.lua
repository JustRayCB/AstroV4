return {
  "rcarriga/nvim-notify",
  config = function(plugin, opts)
    require "astronvim.plugins.configs.notify"(plugin, opts)
    local notify = require "notify"
    local utils = require "astrocore"
    local config = {
      -- stages = "fade_in_slide_out",
      stages = "slide",
      timeout = 1000,
      -- background_colour = "#76b6ef",
      -- background_colour = "#000000",
      icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = " ",
      },
    }
    notify.setup(config)
  end,
}
