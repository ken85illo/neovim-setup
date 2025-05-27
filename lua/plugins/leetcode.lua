return {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
    dependencies = {
        'nvim-telescope/telescope.nvim',
        -- "ibhagwan/fzf-lua",
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
    },
    opts = {
        lang = 'cpp',
        injector = {
            ['python3'] = {
                before = true,
            },
            ['cpp'] = {
                before = { '#include <bits/stdc++.h>', 'using namespace std;' },
                after = 'int main() {}',
            },
            ['java'] = {
                before = 'import java.util.*;',
            },
        },
    },
}
