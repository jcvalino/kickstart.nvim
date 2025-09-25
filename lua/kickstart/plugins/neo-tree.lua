-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      commands = {
        copy_file_or_dir = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()

          -- escape quotes for AppleScript
          path = path:gsub('"', '\\"')

          -- tell macOS clipboard to hold this file/folder
          local script = string.format('osascript -e \'set the clipboard to (POSIX file "%s")\'', path)

          vim.fn.system(script)
          print('Copied ' .. path .. ' to Finder clipboard')
        end,
        open_in_finder = function(state)
          local node = state.tree:get_node()
          local path = node:get_id() -- full path of the file/folder
          -- open containing folder in Finder
          vim.fn.jobstart({ 'open', '-R', path }, { detach = true })
        end,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['gy'] = 'copy_file_or_dir',
          ['O'] = 'open_in_finder',
        },
      },
    },
  },
}
