return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")
        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")
        --local mason_tool_installer = require("mason-tool-installer")
        mason.setup({})

        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "hls",
                "clangd",
                "lua_ls",
                "bashls"
            },
            automatic_installation = true,
        })

    end,
}

