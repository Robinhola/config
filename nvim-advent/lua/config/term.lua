local last_opened_terminal = nil

vim.api.nvim_create_autocmd({ 'TermOpen', 'TermEnter' }, {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    last_opened_terminal = vim.bo.channel
  end
})

vim.api.nvim_create_autocmd({ 'TermClose', }, {
  group = vim.api.nvim_create_augroup('custom-term-close', { clear = true }),
  callback = function()
    last_opened_terminal = nil
  end
})

local open_terminal = function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd("startinsert")
  last_opened_terminal = vim.bo.channel
end

vim.keymap.set("n", "<space>st", open_terminal, { desc = "Open a small terminal" })

vim.keymap.set("n", "<space>tt", function()
    if last_opened_terminal == nil then
      open_terminal()
    end

    local path = vim.fn.getcwd()
    local has_makefile = string.find(vim.fn.glob(path .. "/*"), "Makefile") ~= nil

    if has_makefile then
      vim.fn.chansend(last_opened_terminal, { "make test\r" })
    else
      vim.fn.chansend(last_opened_terminal,
        { "echo 'No makefile found, implement custom test in lua/config/term.lua' && ls -l\r" })
    end
  end,
  { desc = "Run test inside the last terminal open" }
)

vim.keymap.set("t", "<C-w>", "<C-\\><C-n>") -- Escape terminal
