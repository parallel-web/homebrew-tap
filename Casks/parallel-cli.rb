cask "parallel-cli" do
  version "0.9.3"

  on_macos do
    on_arm do
      sha256 "0ef333132303363d8c18a7046eb03cf348d8ec606fe3316d54d91bec91060659"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-arm64.zip"
    end
    on_intel do
      sha256 "7994458207810859192e2d50d5b6bc544f100fc211ea01ff95268a1dababe293"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-darwin-x64.zip"
    end
  end
  on_linux do
    on_arm do
      sha256 "0a6014fc0b7c84976a01f84c23225a7ed52541e2167b69b33d678908a6b2a20e"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-linux-arm64.zip"
    end
    on_intel do
      sha256 "0abd18bc65f73fc680a5d909a83253c11a59b5ae7ee1975a6831aa7a5a054bb9"
      url "https://github.com/parallel-web/parallel-web-tools/releases/download/v#{version}/parallel-cli-linux-x64.zip"
    end
  end

  name "Parallel CLI"
  desc "CLI for the Parallel API - search, extract, research, and enrich data"
  homepage "https://github.com/parallel-web/parallel-web-tools"

  binary "parallel-cli/parallel-cli"

  preflight do
    # Strip quarantine — binary is not notarized (same approach as kreuzberg, etc.)
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/parallel-cli"]
    end
  end

  zap trash: "~/.parallel-cli"
end
