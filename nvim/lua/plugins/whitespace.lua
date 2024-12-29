return {
  "bronson/vim-trailing-whitespace",
  version = "*",
  config = function ()
    vim.keymap.set('n', '<Leader>,', ':FixWhitespace<CR>', { silent = true })
end,
}
