cask "dev-servers" do
  version "1.0.1"
  sha256 "014d55f44ef737010601214d4501442ea38ea714e9092da292e895b483bf4c72"

  url "https://github.com/MohitSharma0101/swiftbar-dev-servers/releases/download/v#{version}/dev-servers.sh"
  name "Dev Servers"
  desc "SwiftBar plugin to see, start and stop local dev servers"
  homepage "https://github.com/MohitSharma0101/swiftbar-dev-servers"

  depends_on cask: "swiftbar"
  depends_on formula: "jq"
  depends_on macos: :ventura

  artifact "dev-servers.sh", target: "~/.swiftbar/dev-servers.sh"

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

      ~/.swiftbar/dev-servers.sh enable

    If you already use another plugin folder, run the installer from the README instead.
  EOS
end
