const config_dir = "$HOME/.config/nvim/modules"

function! g:LoadModuleScript(name)
  exec "source" . g:config_dir . "/" . a:name
endfunction

call LoadModuleScript("general.vim")
call LoadModuleScript("plugins.vim")
