Myapp::Application.routes.draw do

  resources :history_assignments
  resources :assignments do
    member do
      delete "delete_file/:attachment_id", to: 'assignments#delete_file'
    end
    collection do
      get 'detail/:assignment_id' => :detail, as: 'detail'
    end
    get :setSPPD, on: :collection
  end
  resources :service_types
  resources :history_timesheets
  resources :approve_statuses do
    collection do
      get 'doApprove/:parent_id' => :doApprove, as: 'doApprove'
      get 'doApproveAssignment/:parent_id' => :doApproveAssignment, as: 'doApproveAssignment'
    end
    get :createTimesheet, on: :collection
    get :createInfo, on: :collection
    get :createInfoAssignment, on: :collection
    get :doReject, on: :collection
    get :doRejectAssignment, on: :collection
  end
  resources :personil_details do
    member do
      delete "delete_photo/:attachment_id", to: 'personil_details#delete_photo'
    end
  end
  resources :assignment_places
  resources :positions
  resources :timesheets do
    collection do
      delete 'destroyParent/:parent_id' => :destroyParent, as: 'destroyParent'
      get 'detail/:parent_id' => :detail, as: 'detail'
    end
    get :reportSheet, on: :collection
    get :editTimesheet, on: :collection
  end
  resources :activity_titles
  resources :activity_outputs
  devise_for :users, path: '', path_names: { sign_in: 'login_page', sign_out: 'logout'}
  resources :users do
    get :changePassword, on: :collection
  end
  resources :roles

  # You can have the root of your site routed with "root"
  root 'dashboards#dashboard_personil'

  # All routes
  get "dashboards/dashboard_1"
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"

  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/peity"
  get "graphs/sparkline"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/live_favicon"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/jqgrid"

  get "gallery/basic_gallery"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"

  # get '*path', to: 'pages#not_found_error', via: :all
  match '*path', via: :all, to: 'pages#not_found_error', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
