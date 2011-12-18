require 'spec_helper'

describe "authorized links for" do
  %w[guest member reporter officer admin].each do |role|
    describe "#{role}s" do
      before(:each) do
        role == "guest" ? visit("/home") : login(role)
      end

      after(:each) do
        visit "/log_out" unless role == "guest"
      end

      {
        "/admin/events"               => %w[admin officer],
        "/admin/failures"             => %w[admin],
        "/admin/logins"               => %w[admin],
        "/admin/old_ratings"          => %w[admin officer reporter],
        "/admin/old_tournaments"      => %w[admin officer reporter],
        "/admin/tournaments"          => %w[admin officer reporter],
        "/admin/uploads"              => %w[admin officer reporter],
        "/admin/uploads/new"          => %w[admin officer reporter],
        "/admin/users"                => %w[admin],
        "/downloads"                  => %w[admin officer reporter],
        "/downloads/new"              => %w[admin officer],
        "/fide_players"               => %w[admin officer reporter],
        "/fide_ratings"               => %w[admin officer reporter member guest],
        "/icu_players"                => %w[admin officer reporter],
        "/icu_ratings"                => %w[admin officer reporter member guest],
        "/icu_ratings/war"            => %w[admin officer reporter member guest],
        "/icu_ratings/juniors"        => %w[admin officer reporter member guest],
        "/news_items"                 => %w[admin officer reporter member guest],
        "/news_items/new"             => %w[admin officer reporter],
        "/tournaments"                => %w[admin officer reporter member guest],
      }.each do |target, authorized|
        if authorized.include?(role)
          it "get link to and can follow #{target}" do
            page.should have_xpath("//a[@href='#{target}']")
            visit target
            page.should_not have_selector("span.alert", :text => /authoriz/i)
          end
        else
          it "get no link to and can't follow #{target}" do
            page.should_not have_xpath("//a[@href='#{target}']")
            visit target
            page.should have_selector("span.alert", :text => /authoriz/i)
          end
        end
      end
    end
  end
end
