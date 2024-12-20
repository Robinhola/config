local switch_header_source = function()
  local file_ext  = vim.fn.expand('%:e')
  local file_root = vim.fn.expand('%:t:r')

  if file_ext == 'cpp' then
    vim.cmd('find ' .. file_root .. '.h')
  elseif file_ext == 'h' or file_ext == 'hpp' then
    vim.cmd('find ' .. file_root .. '.cpp')
  end

  if file_ext == 'ml' then
    vim.cmd('find ' .. file_root .. '.mli')
  elseif file_ext == 'mli' then
    vim.cmd('find ' .. file_root .. '.ml')
  end
end

vim.keymap.set('n', 'gm', switch_header_source, { noremap = true, silent = true })
