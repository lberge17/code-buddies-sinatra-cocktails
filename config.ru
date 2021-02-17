require "./config/environment"

use Rack::MethodOverride

use SessionsController
use RegistrationsController
run ApplicationController