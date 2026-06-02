cask "parallel-cli" do
  version "0.6.0"

  on_arm do
    sha256 "de54985227de2a2e83b6df3ab64de99d6ee6f8ca38b0f29cdc5aeba09cdfdd3f"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
  end
  on_intel do
    sha256 "ffd9dc63e0766fd2b0ba1552474e4dcac7b3dd2dfd628d735fb129a850998c71"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-x64.zip"
  end

  name "Parallel CLI"
  desc "CLI for the Parallel API - search, extract, research, and enrich data"
  homepage "https://github.com/parallel-web/parallel-web-tools"

  binary "parallel-cli/parallel-cli"

  preflight do
    # Strip quarantine — binary is not notarized (same approach as kreuzberg, etc.)
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/parallel-cli"]
  end

  zap trash: "~/.parallel-cli"
end
