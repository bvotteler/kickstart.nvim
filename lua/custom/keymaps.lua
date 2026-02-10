---@diagnostic disable: undefined-global

-- restore substitute keymap
vim.keymap.set('n', 's', 's', { desc = 'Restore native substitute' })

-- Toggle between Hybrid (number + relativenumber) and Absolute (number only)
vim.keymap.set('n', '<leader>tl', function()
  -- linter thinks :get() isn't defined, it is though.
  ---@diagnostic disable-next-line: undefined-field
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = '[T]oggle [L]ine numbers (Hybrid/Absolute)' })
