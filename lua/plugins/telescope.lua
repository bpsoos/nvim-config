return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup {
            defaults = {
                path_display = { "truncate" },
            },
            pickers = {
                find_files = {
                    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
                }
            },
        }

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pr', builtin.resume, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                additional_args = {
                    "--hidden",
                    "--glob=!**/.git/*",
                },
            })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
