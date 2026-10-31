cask "dev-servers" do
  version "1.2.1"
  sha256 "1670b49dea8166a7fa2c37f2b49169a505ab3027478035ed4798bb4a9c1747ae"

  url "https://github.com/MohitSharma0101/swiftbar-dev-servers/releases/download/v#{version}/dev-servers.sh"
  name "Dev Servers"
  desc "SwiftBar plugin to see, start and stop local dev servers"
  homepage "https://github.com/MohitSharma0101/swiftbar-dev-servers"

  depends_on cask: "swiftbar"
  depends_on formula: "jq"
  depends_on macos: :ventura

  artifact "dev-servers.sh", target: "~/.swiftbar/dev-servers.sh"
  binary "#{Dir.home}/.swiftbar/dev-servers.sh", target: "dev-servers"

  preflight_steps do
    set_permissions "dev-servers.sh", "0755", base: :staged_path
  end

  zap trash: [
    "~/.config/dev-servers",
    "~/Library/Application Support/dev-servers",
    "~/Library/Caches/dev-servers",
    "~/Library/Logs/dev-servers",
  ]

  caveats <<~EOS
    One more step, to point SwiftBar at Dev Servers and start it:

      dev-servers enable

    If you already use another plugin folder, run the installer from the README instead.
  EOS
end
