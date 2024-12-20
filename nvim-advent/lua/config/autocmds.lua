local create = vim.api.nvim_create_autocmd

create('TextYankPost', {
  desc = 'Highlight when yanking (copying) text. Try it with "yap"!',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
