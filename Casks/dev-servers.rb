cask "dev-servers" do
  version "1.0.0"
  sha256 "e10b61ef84b0e832f7f144e5df644c02f60be173f90dfa129d622a2570f617eb"

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
    Dev Servers is installed in ~/.swiftbar. If SwiftBar asks for a plugin folder, choose that one.
    If you already use another plugin folder, run the installer from the README instead.
  EOS
end
