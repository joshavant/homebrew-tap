class Clawbox < Formula
  include Language::Python::Virtualenv

  desc "Provision and manage Clawbox macOS VMs with Tart"
  homepage "https://github.com/joshavant/clawbox"
  url "https://github.com/joshavant/clawbox/releases/download/v1.2.5/clawbox-1.2.5.tar.gz"
  sha256 "5a83796f578f9a768465d1a086ae30b7472d9e7dd44506f52c08f5e1a133944d"
  version "1.2.5"
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
