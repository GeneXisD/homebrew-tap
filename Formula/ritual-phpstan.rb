class RitualPhpstan < Formula
  desc "Ritual-enhanced PHPStan static analysis with auto-ignore patches"
  homepage "https://github.com/GeneXisD/ritualmesh"
  url "https://github.com/phpstan/phpstan/archive/1.10.62.tar.gz"
  sha256 "e8c601e45262b0575bfc91c44188e28b823c6a6b8c5698eaaef67d3157762d02"
  license "MIT"

  depends_on "php"
  depends_on "composer"

  def install
    ENV["COMPOSER_HOME"] = buildpath/".composer"

    # Set up PHPStan with Ritual config
    system "composer", "create-project", "phpstan/phpstan", buildpath/"phpstan", "--no-interaction"
    (buildpath/"phpstan/phpstan.neon.dist").write <<~EOS
      parameters:
        level: 5
        paths:
          - src
          - setup
          - libraries

        ignoreErrors:
          - '~Parameter #1 \\$error_message of static method PhpMyAdmin\\\\Core::fatalError\\(\\) expects string~'
          - '~Parameter #1 \\$format of function sprintf expects string~'
          - '~Instantiated class Symfony\\\\Component\\\\DependencyInjection\\\\Reference not found~'
          - '~Call to method .* on an unknown class FastRoute\\\\RouteCollector~'
          - '~Symfony\\\\Component\\\\ExpressionLanguage\\\\ExpressionLanguage not found~'

        reportUnmatchedIgnoredErrors: false
    EOS

    # Install everything into the prefix
    prefix.install Dir["phpstan/*"]
    bin.install_symlink prefix/"bin/phpstan"
  end

  def caveats
    <<~EOS
      Ritual PHPStan installed.

      ➤ Usage: phpstan analyse -c phpstan.neon.dist

      Your ignoreErrors are pre-configured for EnlightnAudit + PhpMyAdmin projects.

      Extend this by editing:
        #{opt_prefix}/phpstan.neon.dist

      Ritual blessing applied 🌕🐍
    EOS
  end

  test do
    system "#{bin}/phpstan", "--version"
  end
end
