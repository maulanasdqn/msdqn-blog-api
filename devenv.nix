{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  # env.GREET = "devenv";
  # env.DATABASE_URL = "postgresql://youruser:yourpass@yourhost:yourport/yourdb-db?schema=public";

  # https://devenv.sh/packages/
  packages = [
     pkgs.git
     pkgs.nodejs
     pkgs.openssl
     pkgs.nodePackages.yarn
     pkgs.nodePackages.prisma
   ];

  enterShell = with pkgs; ''
     export PRISMA_MIGRATION_ENGINE_BINARY="${prisma-engines}/bin/migration-engine"
     export PRISMA_QUERY_ENGINE_BINARY="${prisma-engines}/bin/query-engine"
     export PRISMA_QUERY_ENGINE_LIBRARY="${prisma-engines}/lib/libquery_engine.node"
     export PRISMA_INTROSPECTION_ENGINE_BINARY="${prisma-engines}/bin/introspection-engine"
     export PRISMA_FMT_BINARY="${prisma-engines}/bin/prisma-fmt"
     export PATH=~/.npm-packages/bin:$PATH
     export NODE_PATH=~/.npm-packages/lib/node_modules
   '';

  # https://devenv.sh/languages/
  languages.nix.enable = true;

  # https://devenv.sh/scripts/
  # scripts.hello.exec = "echo hello from $GREET";

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  processes.ping.exec = "ping google.com";
}
