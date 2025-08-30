return {
  "hotoo/pangu.vim",
  ft = { "markdown", "vimwiki", "text" }, -- 仅在这些文件类型下加载
  config = function()
    vim.g.pangu_rule_date = 1
  end,
}
