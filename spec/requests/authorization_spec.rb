require 'spec_helper'

describe "authorized links" do
  %w{member reporter officer admin}.each do |role|
    describe "#{role}s" do
      before(:each) do
        @user = login_user(role)
      end

      after(:each) do
        visit "/log_out"
      end

      {
        "/admin/events"               => %w{admin officer},
        "/admin/logins"               => %w{admin},
        "/admin/old_tournaments"      => %w{admin officer reporter},
        "/admin/old_rating_histories" => %w{admin officer reporter},
        "/admin/tournaments"          => %w{admin officer reporter},
        "/admin/uploads"              => %w{admin officer reporter},
        "/admin/users"                => %w{admin},
        "/fide_players"               => %w{admin officer reporter},
        "/icu_players"                => %w{admin officer reporter},
        "/tournaments"                => %w{admin officer reporter member},
        "/news_items"                 => %w{admin officer reporter member},
      }.each do |target, authorized|
        if authorized.include?(role)
          it "can access #{target}" do
            page.should have_xpath("//a[@href='#{target}']") unless target == "/admin/old_rating_histories"
            visit target
            page.should_not have_selector("span.alert")
          end
        else
          it "can't access #{target}" do
            page.should_not have_xpath("//a[@href='#{target}']")
            visit target
            page.should have_selector("span.alert", :text => /authoriz/i)
          end
        end
      end
    end
  end
end