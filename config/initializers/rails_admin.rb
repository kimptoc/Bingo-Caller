# RailsAdmin config file. Generated on November 19, 2011 21:37
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|
  
  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de
  
  config.current_user_method { current_caller } # auto-generated
  
  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Bingo Caller', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  #  ==> Authentication (before_filter)
  # This is run inside the controller instance so you can setup any authentication you need to.
  # By default, the authentication will run via warden if available.
  # and will run on the default user scope.
  # If you use devise, this will authenticate the same as authenticate_user!
  # Example Devise admin
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     authenticate_admin!
  #   end
  # end
  # Example Custom Warden
  # RailsAdmin.config do |config|
  #   config.authenticate_with do
  #     warden.authenticate! :scope => :paranoid
  #   end
  # end

  #  ==> Authorization
  # Use cancan https://github.com/ryanb/cancan for authorization:
  # config.authorize_with :cancan

  # Or use simple custom authorization rule:
  # config.authorize_with do
  #   redirect_to root_path unless warden.user.is_admin?
  # end

  # Use a specific role for ActiveModel's :attr_acessible :attr_protected
  # Default is :default
  # config.attr_accessible_role { :default }
  # _current_user is accessible in the block if you need to make it user specific:
  # config.attr_accessible_role { _current_user.role.to_sym }

  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [BingoSession, CalledNumber, Caller, Game, Player, PlayerGame]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [BingoSession, CalledNumber, Caller, Game, Player, PlayerGame]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields :name, :other_name do
  #       # Configuration here will affect all fields named [:name, :other_name], in the list section, for all included models
  #     end
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field!
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Here goes your cross-section field configuration for ModelName.
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  #   show do
  #     # Here goes the fields configuration for the show view
  #   end
  #   export do
  #     # Here goes the fields configuration for the export view (CSV, yaml, XML)
  #   end
  #   edit do
  #     # Here goes the fields configuration for the edit view (for create and update view)
  #   end
  #   create do
  #     # Here goes the fields configuration for the create view, overriding edit section settings
  #   end
  #   update do
  #     # Here goes the fields configuration for the update view, overriding edit section settings
  #   end
  # end
  
  # Your model's configuration, to help you get started:
  
  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible.
  # There can be different reasons for that:
  #  - belongs_to _id and _type (polymorphic) columns are hidden in favor of their associations
  #  - associations are hidden if they have no matchable model found (model not included or non-existant)
  #  - they are part of a bigger plan in a plugin (Devise/Paperclip) and hidden by contract
  # Some fields may be hidden depending on the section, if they aren't deemed suitable for display or edition on that section
  #  - non-editable columns (:id, :created_at, ..) in edit sections
  #  - has_many/has_one associations in list section (hidden by default for performance reasons)
  # Fields may also be marked as read_only (and thus not editable) if they are not mass-assignable by current_user
  

  # config.model BingoSession do
  #   # Found associations:
  #     field :games, :has_many_association 
  #     field :players, :has_many_association 
  #     field :caller, :belongs_to_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :cost_per_card, :decimal 
  #     field :line_prize_per_card, :decimal 
  #     field :bingo_prize_per_card, :decimal 
  #     field :session_name, :string 
  #     field :is_public, :boolean 
  #     field :caller_id, :integer         # Hidden 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model CalledNumber do
  #   # Found associations:
  #     field :game, :belongs_to_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :game_id, :integer         # Hidden 
  #     field :called_ball, :integer 
  #     field :called_time, :datetime 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model Caller do
  #   # Found associations:
  #     field :players, :has_many_association 
  #     field :bingo_sessions, :has_many_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :email, :string 
  #     field :password, :password 
  #     field :password_confirmation, :password 
  #     field :password_salt, :string         # Hidden 
  #     field :reset_password_token, :string         # Hidden 
  #     field :remember_token, :string         # Hidden 
  #     field :remember_created_at, :datetime 
  #     field :sign_in_count, :integer 
  #     field :current_sign_in_at, :datetime 
  #     field :last_sign_in_at, :datetime 
  #     field :current_sign_in_ip, :string 
  #     field :last_sign_in_ip, :string 
  #     field :failed_attempts, :integer 
  #     field :unlock_token, :string 
  #     field :locked_at, :datetime 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #     field :name, :string 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model Game do
  #   # Found associations:
  #     field :called_numbers, :has_many_association 
  #     field :bingo_session, :belongs_to_association 
  #     field :player_with_first_line, :belongs_to_association 
  #     field :player_with_bingo, :belongs_to_association 
  #     field :player_games, :has_many_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :max_balls, :integer 
  #     field :bingo_session_id, :integer         # Hidden 
  #     field :player_with_first_line_id, :integer         # Hidden 
  #     field :player_with_bingo_id, :integer         # Hidden 
  #     field :secs_between_calls, :integer 
  #     field :game_number, :integer 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model Player do
  #   # Found associations:
  #     field :bingo_session, :belongs_to_association 
  #     field :caller, :belongs_to_association 
  #     field :player_games, :has_many_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :bingo_session_id, :integer         # Hidden 
  #     field :name, :string 
  #     field :caller_id, :integer         # Hidden 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

  # config.model PlayerGame do
  #   # Found associations:
  #     field :player, :belongs_to_association 
  #     field :game, :belongs_to_association 
  #   # Found columns:
  #     field :id, :integer 
  #     field :player_id, :integer         # Hidden 
  #     field :game_id, :integer         # Hidden 
  #     field :cards_played, :integer 
  #     field :created_at, :datetime 
  #     field :updated_at, :datetime 
  #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end

end
