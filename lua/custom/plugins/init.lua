-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'vimwiki/vimwiki',
    --event = "BufEnter *.md",
    lazy = false, -- load asap
    keys = { '<leader>ww', '<leader>wt' },
    init = function()
      vim.g.vimwiki_folding = ''
      vim.g.vimwiki_list = {
        {
          path = '~/.local/share/wiki',
          syntax = 'markdown',
          ext = '.md',
        },
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end,
  },
}
