return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)
    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
    vim.keymap.set("n", "<space>en", function()
      local opts = require('telescope.themes').get_ivy({
        cwd = vim.fn.stdpath("config")
      })
      require('telescope.builtin').find_files(opts)
    end, { desc = "Search nvim config files!" })
  end
}
