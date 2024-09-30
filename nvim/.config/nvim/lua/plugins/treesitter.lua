-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    --ensure_installed = {
    --  "lua",
    --  "vim",
    -- add more arguments for adding more treesitter parsers
    --},
  },
}
