local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = {
            "javascript",
            "typescript",
            "tsx",
            "html",
            "css",
            "scss",
            "bash",
            "lua",
            "json",
            "python"
        },
        highlight = {
            enable = true,
            use_languagetree = true
        }
    }
end

return M
