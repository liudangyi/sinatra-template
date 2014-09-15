
# index
get "/" do
  erb :index
end

helpers do
  CAS_CLIENT = CASClient::Client.new(
    cas_base_url: CONFIG["cas_url"],
    log: Logger.new(STDOUT),
    ticket_store_config: {storage_dir: "tmp/tickets"}
  )

  def current_user
    @current_user
  end
end
