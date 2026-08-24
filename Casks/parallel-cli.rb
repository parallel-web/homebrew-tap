cask "parallel-cli" do
  version "0.9.3"

  on_arm do
    sha256 "0ef333132303363d8c18a7046eb03cf348d8ec606fe3316d54d91bec91060659"
    url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
  end
  on_intel do
    sha256 "7994458207810859192e2d50d5b6bc544f100fc211ea01ff95268a1dababe293"
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
