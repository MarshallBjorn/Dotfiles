return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local mason_lspconfig = require("mason-lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Показує преференції ЛСП"
        keymap.set("n", "gR", "<cmd>Telescope lsp_preferences<CR>", opts)

        opts.desc = "Показує декларацію"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Показує дефініції ЛСП"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Показує імплементацію ЛСП"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Показує дефініцію типів ЛСП"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Показує можливості зміни коду"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Розумна зміна імені"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Показує діагностику буферу"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Показує діагностику лінії"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Повертає до минулої діагностики"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Йде на наступну діагностику"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

       opts.desc = "Показує документацію того, що знаходиться під курсором"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Перезавантажує ЛСП"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warning = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
    })
  end,
}
