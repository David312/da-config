" Plugins config

call plug#begin()
  Plug 'preservim/nerdtree'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " Erlang/OTP
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete'
  Plug 'vim-erlang/vim-erlang-tags'
call plug#end()

const plugin_config_dir = config_dir . "/plugins_config"

function! LoadPluginConfig(name)
  exec "source" . g:plugin_config_dir . "/" . a:name
endfunction

call LoadPluginConfig("nerd-tree.vim")
