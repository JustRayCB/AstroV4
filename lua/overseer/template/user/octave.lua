return{
    name = "octave",
    builder = function ()
        local file = vim.fn.expand "%:p"
        return{
            cmd = {"octave"},
            args = {
                file,
            },

            components = {
                -- { "on_output_quickfix", set_diagnostics = true },
                "on_result_diagnostics",
                { "on_complete_notify", statuses = { "FAILURE" } },
                "default",
            },
        }
    end,
    condition = {
        filetype = { "octave", "m", "matlab" },
    },
}
