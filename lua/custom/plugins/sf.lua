-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'xixiaofinland/sf.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
    },

    config = function()
      require('sf').setup {
        -- Unless you want to customize, no need to copy-paste any of these
        -- They are applied automatically

        -- This plugin has many default hotkey mappings supplied
        -- This flag enable/disable these hotkeys defined
        -- It's highly recommended to set this to `false` and define your own key mappings
        -- Set to `true` if you don't mind any potential key mapping conflicts with your own
        enable_hotkeys = false,

        -- this setting takes effect only when You have "enable_hotkeys = true"(i.e. use default supplied hotkeys).
        -- In the default hotkeys, some hotkeys are on "project level" thus always enabled. Examples: "set default org", "fetch org info".
        -- Other hotkeys are enabled when only metadata filetypes are loaded in the current buffer. Example: "push/retrieve current metadata file"
        -- This list defines what metadata filetypes have the "other hotkeys" enabled.
        -- For example, if you want to push/retrieve css files, it needs to be added into this list.
        hotkeys_in_filetypes = {
          'apex',
          'sosl',
          'soql',
          'javascript',
          'html',
        },

        -- When Nvim is initiated, the sf org list is automatically fetched and target_org is set (if available) by `:SF org fetchList`
        -- You can set it to `false` and have a manual control
        fetch_org_list_at_nvim_start = true,

        -- Define what metadata to be listed in `list_md_to_retrieve()` (<leader>ml)
        -- Salesforce has numerous metadata types. We narrow down the scope of `list_md_to_retrieve()`.
        types_to_retrieve = {
          'ApexClass',
          'ApexTrigger',
          'StaticResource',
          'LightningComponentBundle',
        },

        -- Configuration for the integrated terminal
        term_config = {
          blend = 10, -- background transparency: 0 is fully opaque; 100 is fully transparent
          dimensions = {
            height = 0.4, -- proportional of the editor height. 0.4 means 40%.
            width = 0.8, -- proportional of the editor width. 0.8 means 80%.
            x = 0.5, -- starting position of width. Details in `get_dimension()` in raw_term.lua source code.
            y = 0.9, -- starting position of height. Details in `get_dimension()` in raw_term.lua source code.
          },
        },

        -- the sf project metadata folder, update this in case you diverged from the default sf folder structure
        default_dir = '/force-app/main/default/',

        -- the folder this plugin uses to store intermediate data. It's under the sf project root directory.
        plugin_folder_name = '/sf_cache/',

        -- after the test running with code coverage completes, display uncovered line sign automatically.
        -- you can set it to `false`, then manually run toggle_sign command.
        auto_display_code_sign = true,

        -- code coverage sign icon colors
        code_sign_highlight = {
          covered = { fg = '#b7f071' }, -- set `fg = ""` to disable this sign icon
          uncovered = { fg = '#f07178' }, -- set `fg = ""` to disable this sign icon
        },
      }

      -- all your key definitions put below
      local Sf = require 'sf'
      vim.keymap.set('n', '<leader>xs', Sf.set_target_org, { desc = 'SFD[X] [S]et Target Org' })
      vim.keymap.set('n', '<leader>xS', Sf.set_global_target_org, { desc = 'SFD[X] [S]et Global Target Org' })
      vim.keymap.set('n', '<leader>xrm', Sf.retrieve_package, { desc = 'SFD[X] [R]etrieve This [M]anifest' })
      vim.keymap.set('n', '<leader>xrf', Sf.retrieve, { desc = 'SFD[X] [R]etreive This [F]ile' })
      vim.keymap.set('n', '<leader>xo', Sf.org_open, { desc = 'SFD[X] [O]pen Default Org' })
      vim.keymap.set('n', '<leader>xd', Sf.diff_in_target_org, { desc = 'SFD[X] [D]iff in Target Org' })
      vim.keymap.set('n', '<leader>xc', Sf.create_apex_class, { desc = 'SFD[X] Create Apex [C]lass' })
      vim.keymap.set('n', '<leader>xt', Sf.create_trigger, { desc = 'SFD[X] Create [T]rigger' })
    end,
  },
}
