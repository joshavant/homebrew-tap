class Clawbox < Formula
  include Language::Python::Virtualenv

  desc "Provision and manage Clawbox macOS VMs with Tart"
  homepage "https://github.com/joshavant/clawbox"
  url "https://github.com/joshavant/clawbox/releases/download/v1.2.2/clawbox-1.2.2.tar.gz"
  sha256 "598a17db93330d58a52523c419f4b24aa06d31e86698b9cc0c2531c72566242a"
  version "1.2.2"
  license "MIT"
  head "https://github.com/joshavant/clawbox.git", branch: "main"

  depends_on "python@3.12"
  depends_on "ansible"
  depends_on "hashicorp/tap/packer"
  depends_on "cirruslabs/cli/tart"
  depends_on "mutagen-io/mutagen/mutagen"

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/clawbox --help")
    assert_match "Clawbox macOS VM orchestration", output
  end
end
