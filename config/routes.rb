CSI3140613::Application.routes.draw do

  match 'login' => 'application#login'

  root :to => 'application#index'

end
