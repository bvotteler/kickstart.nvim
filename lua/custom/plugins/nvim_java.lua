return {
  'nvim-java/nvim-java',
  init = function()
    -- Trigger spacing rules automatically when opening a Java file
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        vim.opt_local.expandtab = true -- Use spaces instead of tabs
        vim.opt_local.shiftwidth = 4 -- 4 spaces for indent
        vim.opt_local.tabstop = 4 -- 1 tab = 4 spaces visual
        vim.opt_local.softtabstop = 4 -- 4 spaces for backspace/editing
        vim.b.disable_autoformat = true
      end,
    })
  end,
  config = function()
    require('java').setup {
      spring_boot_tools = {
        enable = false,
      },
      jdk = {
        -- Force nvim-java to point to system runtime path
        -- path = '/usr/lib/jvm/default',
        path = '/usr/lib/jvm/java-21-openjdk',
      },
    }

    vim.lsp.enable 'jdtls'
  end,
}
