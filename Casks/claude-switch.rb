cask "claude-switch" do
  version "0.2.1"
  sha256 "2e47352f78720e0178ab862731f54cedefe545a97ea01a399fe42970c94bf68e"

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
