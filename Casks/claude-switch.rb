cask "claude-switch" do
  version "0.2.0"
  sha256 "ba57eed1864b2c9391078519a9b57ba05f8fd37a991ca01b258084e0ce48dc24"

  url "https://github.com/jafar-albadarneh/claude-switch/releases/download/v#{version}/ClaudeSwitch-#{version}.zip"
  name "Claude Switch"
  desc "Menu bar account switcher for Claude Code"
  homepage "https://github.com/jafar-albadarneh/claude-switch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "ClaudeSwitch.app"

  binary "#{appdir}/ClaudeSwitch.app/Contents/MacOS/claude-switch"

  uninstall quit:       "ai.thenward.ClaudeSwitch",
            launchctl:  "ai.thenward.ClaudeSwitch"

  # We deliberately do NOT zap ~/.claude or the Claude Code-credentials Keychain
  # item. Those belong to Claude Code, not to Claude Switch, and a brew uninstall
  # should not sign the user out of their account.
  zap trash: [
    "~/.claude-switch",
    "~/Library/Preferences/ai.thenward.ClaudeSwitch.plist",
    "~/Library/Saved Application State/ai.thenward.ClaudeSwitch.savedState",
  ]
end
