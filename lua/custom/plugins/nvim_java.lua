return {
  'nvim-java/nvim-java',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.b.disable_autoformat = true
      end,
    })
  end,
  config = function()
    -- Initialize nvim-java.
    -- In modern Neovim, this automatically handles the vim.lsp.config injection internally.
    require('java').setup {
      spring_boot_tools = {
        enable = false,
      },
      jdk = {
        path = '/usr/lib/jvm/default',
      },
    }
    vim.api.nvim_create_user_command('JavaCleanCache', function()
      -- Expand the exact home path to target the nvim-java cache safely
      local cache_dir = vim.fn.expand '~/.cache/nvim/jdtls/'

      -- Forcefully wipe the LSP cache directory from inside Neovim
      vim.fn.delete(cache_dir, 'rf')

      -- Inform the user and prompt them to handle the local build artifacts
      vim.notify('LSP Cache wiped! Run ./gradlew clean in your terminal and restart Neovim.', vim.log.levels.WARN)
    end, {})
  end,
}
