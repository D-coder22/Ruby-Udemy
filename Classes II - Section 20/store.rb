module Store

  App = Struct.new(:name , :developer, :version)

  APPS = [
    App.new(:Chat, :Facebook, 2.0),
    App.new(:Twitter, :twitter, 5.8)
  ]

  def self.find_app(name)
    APPS.find{|app| app.name==name}
  end
end
