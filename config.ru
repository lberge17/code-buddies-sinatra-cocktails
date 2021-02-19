require "./config/environment"

use Rack::MethodOverride

use CocktailsController
use SessionsController
use RegistrationsController
run ApplicationController