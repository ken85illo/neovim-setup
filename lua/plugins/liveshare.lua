return {
    'azratul/live-share.nvim',
    dependencies = {
        'darkerthanblack2000/open-pair',
    },
    config = function()
        require('live-share').setup {
            username = 'kennethpabillo',
        }
    end,
}
