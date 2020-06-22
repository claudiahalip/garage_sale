require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


require_relative 'app/controllers/user_controller'
require_relative 'app/controllers/item_controller'

use ItemController
use UserController

run ApplicationController
