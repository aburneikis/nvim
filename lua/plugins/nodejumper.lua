return {
  'burneikis/nodejumper.nvim',
  config = function()
    require('nodejumper').setup({
      dim_background = false,
    })
  end
}
