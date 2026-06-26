-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    priority = 1000,
    config = function()
      vim.defer_fn(function()
        require("nvim-treesitter.config").setup({
          ensure_installed = { "python", "lua", "rust", "javascript" },
          highlight = { enable = true },
          auto_install = true,
        })
      end, 0)
    end,
  },

  -- LSP (0.11+ native style)
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("pyright", {})
      vim.lsp.enable("pyright")
    end,
  },
})
