require 'spec_helper'

describe Ricer4::Plugins::Internet do
  
  # LOAD
  bot = Ricer4::Bot.new("ricer4.spec.conf.yml")
  bot.db_connect
  ActiveRecord::Magic::Update.install
  ActiveRecord::Magic::Update.run
  bot.load_plugins
  ActiveRecord::Magic::Update.run

  it("does only allow http schemes by detault") do
    expect(bot.exec_line_for("Internet/Http", "ftp://google.de")).to start_with("err_usage:{\"error\":\"err_invalid_scheme:{")
  end

  it("has a working net.http command") do
    expect(bot.exec_line_for("Internet/Http", "http://google.de")).to start_with("<!doctype html>")
  end
  
end
